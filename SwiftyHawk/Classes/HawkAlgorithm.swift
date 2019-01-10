//
//  HawkAlgorithm.swift
//  SwiftyHawk
//
//  Created by Muhamed ALGHZAWI on 08/01/2019.
//

import Foundation

public enum HawkAlgorithm : String {
    case SHA1
    case SHA256
    
    var name: String {
        return self.rawValue.lowercased()
    }
    
    func calculateHash(ofString str: String) -> Data {
        let data = str.data(using: .utf8)!
        var digest = [UInt8](repeating: 0, count:self.digestLength)
        data.withUnsafeBytes {
            _ = self.hashingFunc($0, CC_LONG(data.count), &digest)
        }
        return Data(bytes: digest)
    }
    
    func calculateHmac(ofString str: String, usingKey key: String) -> Data {
        let cKey = key.cString(using: String.Encoding.utf8)
        let cData = str.cString(using: String.Encoding.utf8)
        var result = [CUnsignedChar](repeating: 0, count: Int(self.digestLength))
        CCHmac(self.asCCHmacAlgorithm, cKey!, Int(strlen(cKey!)), cData!, Int(strlen(cData!)), &result)
        let hmacData: Data = Data(bytes: result, count: (Int(self.digestLength)))
        return hmacData
    }
    
    
    fileprivate var digestLength: Int {
        get {
            switch self {
            case .SHA1:
                return Int(CC_SHA1_DIGEST_LENGTH)
            case .SHA256:
                return Int(CC_SHA256_DIGEST_LENGTH)
            }
        }
    }
    
    fileprivate var hashingFunc: ((_ data: UnsafeRawPointer?, _ len: CC_LONG, _ md: UnsafeMutablePointer<UInt8>?) -> UnsafeMutablePointer<UInt8>?) {
        get {
            switch self {
            case .SHA1:
                return CC_SHA1
            case .SHA256:
                return CC_SHA256
            }
        }
    }
    
    fileprivate var asCCHmacAlgorithm: CCHmacAlgorithm {
        get {
            switch self {
            case .SHA1:
                return CCHmacAlgorithm(kCCHmacAlgSHA1)
            case .SHA256:
                return CCHmacAlgorithm(kCCHmacAlgSHA256)
            }
        }
    }
}
