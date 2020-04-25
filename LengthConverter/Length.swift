//
//  Length.swift
//  LengthConverter
//
//  Created by Mehmet Koca on 25.04.2020.
//  Copyright © 2020 Mehmet Koca. All rights reserved.
//

import Foundation

enum Length: String, CaseIterable {
    
    case meter = "Meter"
    case kilometer = "Kilometer"
    case feet = "Feet"
    case miles = "Miles"
    
    var lengthSymbol: String {
        switch self {
        case .meter:
            return "m"
        case .kilometer:
            return "km"
        case .feet:
            return "ft"
        case .miles:
            return "mi"
        }
    }
    
    func convert(to: Length, value: Double) -> Double {
        switch self {
        case .meter:
            switch to {
            case .meter:
                return value
            case .kilometer:
                return value * 0.001
            case .feet:
                return value * 3.28084
            case .miles:
                return value * 0.000621371
            }
        case .kilometer:
            switch to {
            case .meter:
                return value * 1000
            case .kilometer:
                return value
            case .feet:
                return value * 3280.84
            case .miles:
                return value * 0.621371
            }
        case .feet:
            switch to {
            case .meter:
                return value * 0.3048
            case .kilometer:
                return value * 0.0003048
            case .feet:
                return value
            case .miles:
                return value * 0.000189394
            }
        case .miles:
            switch to {
            case .meter:
                return value * 1609.34
            case .kilometer:
                return value * 1.6093
            case .feet:
                return value * 5280
            case .miles:
                return value
            }
        }
    }
}
