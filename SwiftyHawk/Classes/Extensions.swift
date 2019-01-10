//
//  CryptoHelpers.swift
//  SwiftyHawk
//
//  Created by Muhamed ALGHZAWI on 09/01/2019.
//

import Foundation

extension String {
    func encapsulated(with str: String) -> String {
        return "\(str)\(self)\(str)"
    }
}

extension Int {
    var string: String {
        get {
            return "\(self)"
        }
    }
}
