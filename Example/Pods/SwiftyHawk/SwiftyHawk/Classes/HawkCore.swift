//
//  HawkCore.swift
//  SwiftyHawk
//
//  Created by Muhamed ALGHZAWI on 10/01/2019.
//

import Foundation


/// The type of the Mac to generate.
///
/// - header: Header Authorization.
/// - response: Server Response Validation.
/// - bewit: Bewit Generation.
/// - message: Message Validation.
enum MacType : String {
    case header
    case response
    case bewit
    case message
}


/// Provides a core functionality to use from the Client and other future classes.
class HawkCore {
    
    
    /// Calculate the payload hash (if it's required).
    ///
    /// - Parameters:
    ///   - payload: The request payload.
    ///   - contentType: The Content-Type of the payload.
    ///   - alg: The algorithm to use.
    /// - Returns: Returns a base-64 string representation of the generated digest.
    static func calculateHash(forPayload payload: String, asType contentType: String, usingAlgorithm alg: HawkAlgorithm) -> String {
        
        var payloadFormatted = "hawk.\(Constants.HAWK_VERSION).payload\n"
        payloadFormatted.append((contentType == "" ? "" : contentType.components(separatedBy: ";")[0].lowercased()) + "\n")
        payloadFormatted.append(payload + "\n")
        
        let hash = alg.calculateHash(ofString: payloadFormatted).base64EncodedString()
        return hash
    }
    
    
    
    /// Calculate the Hmac for the specific type.
    ///
    /// - Parameters:
    ///   - type: Type of the Hmac usage.
    ///   - creds: The Hawk Credentials.
    ///   - options: The `Artifacts` to use to generate the Hmac.
    /// - Returns: Returns a base-64 representation of the calculated Hmac.
    static func calculateMac(forType type: MacType, usingCredentials creds: HawkCredentials, andOptions options: HawkOptions) -> String {
        let normalizedData = normalize(forType: type, usingOptions: options)
        return creds.algorithm.calculateHmac(ofString: normalizedData, usingKey: creds.key).base64EncodedString()
    }
    
    
    fileprivate static func normalize(forType type: MacType, usingOptions options: HawkOptions) -> String{
        
        var normalizedStr = "hawk.\(Constants.HAWK_VERSION).\(type.rawValue)\n"
        normalizedStr.append("\(options.ts ?? 0)\n")
        normalizedStr.append((options.nonce ?? "") + "\n")
        normalizedStr.append((options.method?.name ?? "") + "\n")
        normalizedStr.append((options.url?.path ?? "") + "\n")
        normalizedStr.append((options.url?.host?.lowercased() ?? "") + "\n")
        normalizedStr.append("\((options.url?.port ?? (options.url?.scheme?.lowercased() == "https" ? 443 : 80)))" + "\n")
        normalizedStr.append((options.payloadHash ?? "") + "\n")
        normalizedStr.append((options.ext?.replacingOccurrences(of: "\\", with: "\\\\").replacingOccurrences(of: "\n", with: "\\n") ?? "") + "\n")
        
        if let ozApp = options.app {
            normalizedStr.append(ozApp + "\n")
            normalizedStr.append((options.dlg ?? "") + "\n")
        }
        
        return normalizedStr
    }
}
