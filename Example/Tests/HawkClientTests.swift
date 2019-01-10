//
//  HawkTests.swift
//  SwiftyHawk_Example
//
//  Created by Muhamed ALGHZAWI on 10/01/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import SwiftyHawk


class HawkClientTests: XCTestCase {
    
    let sha1Credes: HawkCredentials = HawkCredentials(id: "123456", key: "2983d45yun89q", algorithm: .SHA1)
    let sha256Credes: HawkCredentials = HawkCredentials(id: "123456", key: "2983d45yun89q", algorithm: .SHA256)
    
    let httpUrl = "http://example.net/somewhere/over/the/rainbow"
    let httpsUrl = "https://example.net/somewhere/over/the/rainbow"
    
    
    func test_HawkClient_AuthorizationHeader_SHA1_PayloadStr_NoContentType() {
        let client = HawkClient(creds: sha1Credes)
        let options = HawkOptions(url: URL(string: httpUrl), method: .post)
        options.ext = "Bazinga!"
        options.ts = 1353809207
        options.nonce = "Ygvqdz"
        options.payload = "something to write about"
       let header = client.generateAuthorizationHeader(usingOptions: options)
        
        XCTAssert(header == "Hawk id=\"123456\", ts=\"1353809207\", nonce=\"Ygvqdz\", hash=\"bsvY3IfUllw6V5rvk4tStEvpBhE=\", ext=\"Bazinga!\", mac=\"qbf1ZPG/r/e06F4ht+T77LXi5vw=\"")
    }
    
    
    func test_HawkClient_AuthorizationHeader_SHA256_PayloadStr() {
        let client = HawkClient(creds: sha256Credes)
        let options = HawkOptions(url: URL(string: httpsUrl), method: .post)
        options.ext = "Bazinga!"
        options.ts = 1353809207
        options.nonce = "Ygvqdz"
        options.payload = "something to write about"
        options.contentType = "text/plain"
        let header = client.generateAuthorizationHeader(usingOptions: options)
        
        XCTAssert(header == "Hawk id=\"123456\", ts=\"1353809207\", nonce=\"Ygvqdz\", hash=\"2QfCt3GuY9HQnHWyWD3wX68ZOKbynqlfYmuO2ZBRqtY=\", ext=\"Bazinga!\", mac=\"q1CwFoSHzPZSkbIvl0oYlD+91rBUEvFk763nMjMndj8=\"")
    }
    
    func test_HawkClient_AuthorizationHeader_SHA256_PayloadStr_NoExt() {
        let client = HawkClient(creds: sha256Credes)
        let options = HawkOptions(url: URL(string: httpsUrl), method: .post)
        options.ts = 1353809207
        options.nonce = "Ygvqdz"
        options.payload = "something to write about"
        options.contentType = "text/plain"
        let header = client.generateAuthorizationHeader(usingOptions: options)
        
        XCTAssert(header == "Hawk id=\"123456\", ts=\"1353809207\", nonce=\"Ygvqdz\", hash=\"2QfCt3GuY9HQnHWyWD3wX68ZOKbynqlfYmuO2ZBRqtY=\", mac=\"HTgtd0jPI6E4izx8e4OHdO36q00xFCU0FolNq3RiCYs=\"")
    }
    
    
    func test_HawkClient_AuthorizationHeader_SHA256_NoPayload_NoExt() {
        let client = HawkClient(creds: sha256Credes)
        let options = HawkOptions(url: URL(string: httpsUrl), method: .post)
        options.ts = 1353809207
        options.nonce = "Ygvqdz"
        options.contentType = "text/plain"
        options.payload = ""
        let header = client.generateAuthorizationHeader(usingOptions: options)
        
        XCTAssert(header == "Hawk id=\"123456\", ts=\"1353809207\", nonce=\"Ygvqdz\", hash=\"q/t+NNAkQZNlq/aAD6PlexImwQTxwgT2MahfTa9XRLA=\", mac=\"U5k16YEzn3UnBHKeBzsDXn067Gu3R4YaY6xOt9PYRZM=\"")
    }
    
    func test_HawkClient_AuthorizationHeader_SHA256_PayloadNull_ContentTypeNull_NoExt() {
        let client = HawkClient(creds: sha256Credes)
        let options = HawkOptions(url: URL(string: httpsUrl), method: .post)
        options.ts = 1353809207
        options.nonce = "Ygvqdz"
        let header = client.generateAuthorizationHeader(usingOptions: options)
        
        XCTAssert(header == "Hawk id=\"123456\", ts=\"1353809207\", nonce=\"Ygvqdz\", mac=\"VEkKgmmtWE6WyJXHYlfJan8+cQrVdsrvqnPaJTvBw8Q=\"")
    }
}
