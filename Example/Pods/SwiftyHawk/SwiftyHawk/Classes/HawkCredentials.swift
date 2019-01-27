//
//  HawkCredentials.swift
//  SwiftyHawk
//
//  Created by Muhamed ALGHZAWI on 08/01/2019.
//

import Foundation

/// The previously-obtained Hawk credentials to use.
public struct HawkCredentials {
    
    /// Identifier (User Id, Username..)
    public let id: String
    
    /// A.K.A Password.
    public let key: String
    
    /// The algorithm to use to generate the hash and the mac.
    public let algorithm: HawkAlgorithm
    
    public init(id: String, key: String, algorithm: HawkAlgorithm) {
        self.id = id
        self.key = key
        self.algorithm = algorithm
    }
}
