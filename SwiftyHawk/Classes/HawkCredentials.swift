//
//  HawkCredentials.swift
//  SwiftyHawk
//
//  Created by Muhamed ALGHZAWI on 08/01/2019.
//

import Foundation

struct HawkCredentials {
    let key: String
    let id: String
    let algorithm: HawkAlgorithm
    
    public init(key: String, id: String, algorithm: HawkAlgorithm) {
        self.key = key
        self.id = id
        self.algorithm = algorithm
    }
}
