//
//  HawkClient.swift
//  SwiftyHawk
//
//  Created by Muhamed ALGHZAWI on 08/01/2019.
//

import Foundation

public enum HawkError : Error {
    /// The provided credentials are invalid.
    case invalidCredentials
    
    /// A mandatory argument wasn't provided or it's invalid.
    case invalidArgument(argName: String)
}


/// Supported Http Methods to use with Hawk.
public enum HttpMethod : String {
    case get
    case post
    case put
    case head
    case delete
    case patch
    case options
    
    var name: String {
        return self.rawValue.uppercased()
    }
}

public class HawkClient {
    
    private var credentials: HawkCredentials
    private var timeSkew: Int = 0
    
    public init(creds: HawkCredentials) throws {
        if creds.key.count < 1 || creds.id.count < 1 {
            throw HawkError.invalidCredentials
        }
        
        self.credentials = creds
    }
    
    public func setServer(time secondsDiff: Int) {
        self.timeSkew = secondsDiff
    }
    
    
    public func generateAuthorizationHeader(usingOptions options: HawkOptions) throws -> String {
        
        guard options.url != nil || !(options.url?.isHttpProtocol() ?? false) else {
            throw HawkError.invalidArgument(argName: "Url is invalid")
        }
        
        guard options.method != nil else {
            throw HawkError.invalidArgument(argName: "Http Method is invalid")
        }
        
        if options.nonce == nil {
            options.nonce = UUID().uuidString
        }
        
        if options.ts == nil {
            options.ts = (Int(Date().timeIntervalSince1970) + self.timeSkew)
        }
        
        if options.payloadHash == nil && options.payload != nil {
            // Cacluate Payload Hash
            options.payloadHash = HawkCore.calculateHash(forPayload: options.payload ?? "", asType: options.contentType ?? "", usingAlgorithm: credentials.algorithm)
        }
        else if let providedPayloadHash = options.payloadHash {
            options.payloadHash = providedPayloadHash
        }
        
        let mac = HawkCore.calculateMac(forType: .header, usingCredentials: credentials, andOptions: options)
        
        var header = "Hawk id=\(credentials.id.encapsulated(with: "\"")), "
        header.append("ts=\(options.ts!.string.encapsulated(with: "\"")), ")
        header.append("nonce=\(options.nonce!.encapsulated(with: "\"")), ")
        header.append(options.payloadHash != nil ? "hash=\(options.payloadHash!.encapsulated(with: "\"")), " : "")
        header.append(options.ext != nil ? "ext=\(options.ext!.encapsulated(with: "\"")), "  : "")
        header.append("mac=\(mac.encapsulated(with: "\""))")
        
        if let ozApp = options.app {
            header.append(", app=\(ozApp.encapsulated(with: "\"")), ")
            header.append("dlg=\(options.dlg!.encapsulated(with: "\""))")
        }
        
        return header
    }
    
    public func getBewit(forUrl url: URL, usingOptions options: HawkOptions? = nil) -> String {
        // TODO: Implement.
        return ""
    }
    
    
    
}
