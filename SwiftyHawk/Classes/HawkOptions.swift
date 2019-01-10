//
//  HawkOptions.swift
//  SwiftyHawk
//
//  Created by Muhamed ALGHZAWI on 09/01/2019.
//

import Foundation

/// Hawk Authentication Options
public class HawkOptions {
    
    /// The url of the request.
    public var url: URL?
    
    /// The method of the request.
    public var method: HttpMethod?
    
    /// Extra information to pass to the server.
    public var ext: String?
    
    /// A pre-calcualated hash of the payload, if the payload validation is required.
    public var payloadHash: String?
    
    /// If the payload validation is required, and the hash not calcualted.
    public var payload: String?
    
    /// Payload ContentType, If the payload validation is required, and the hash not calcualted.
    public var contentType: String?
    
    /// Optional Timestamp, if not provided HawkClient will get the current TimeStamp.
    public var ts: Int?
    
    /// Optional Nonce, if not provided HawkClient will generate a random nonce.
    public var nonce: String?
    
    /// Oz Application Id.
    public var app: String?
    
    /// Oz delegator.
    public var dlg: String?
    
    
    
    /// Initialize a new HawkOptions instance.
    ///
    /// - Parameters:
    ///   - url: The url of the request.
    ///   - method: The Http Method of the request.
    ///   - ext: Extra information to pass to the server
    ///   - payloadHash: A pre-calcualated hash of the payload, if the payload validation is required.
    ///   - payload: If the payload validation is required, and the hash not calcualted.
    ///   - contentType: Payload ContentType, If the payload validation is required, and the hash not calcualted
    ///   - ts: Optional Timestamp, if not provided HawkClient will get the current TimeStamp.
    ///   - nonce: Optional Nonce, if not provided HawkClient will generate a random nonce.
    ///   - app: Oz Application Id.
    ///   - dlg: Oz delegator.
    public init(url: URL?, method: HttpMethod?, ext: String?, payloadHash: String?, payload: String?, contentType: String?, ts: Int?, nonce: String?, app: String?, dlg: String?) {
        self.url = url
        self.method = method
        self.ext = ext
        self.payloadHash = payloadHash
        self.payload = payload
        self.contentType = contentType
        self.ts = ts
        self.nonce = nonce
        self.app = app
        self.dlg = dlg
    }
    

    /// Initialize a new HawkOptions instance with the required values only
    ///
    /// - Parameters:
    ///   - url: The url of the request.
    ///   - method: The Http Method of the request.
    public convenience init(url: URL?, method: HttpMethod?) {
        self.init(url: url, method: method, ext: nil, payloadHash: nil, payload: nil, contentType: nil, ts: nil, nonce: nil, app: nil, dlg: nil)
    }
}
