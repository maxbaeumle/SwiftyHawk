//
//  HawkCredentials.swift
//  SwiftyHawk
//
//  Created by Muhamed ALGHZAWI on 08/01/2019.
//

import Foundation

public struct HawkCredentials {
    public let key: String
    public let id: String
    public let algorithm: HawkAlgorithm
    
    public init(id: String, key: String, algorithm: HawkAlgorithm) {
        self.id = id
        self.key = key
        self.algorithm = algorithm
    }
}
