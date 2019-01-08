//
//  HawkAlgorithm.swift
//  Pods-SwiftyHawk_Example
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
}
