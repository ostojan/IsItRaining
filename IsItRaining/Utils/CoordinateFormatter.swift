//
//  CoordinateFormatter.swift
//  IsItRaining
//
//  Created by ostojan on 16/08/2023.
//

import Foundation

class CoordinateFormatter: Formatter {
    let numberFormatter = NumberFormatter()

    override init() {
        super.init()
        numberFormatter.maximumFractionDigits = 5
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func string(from coordinate: Coordinate) -> String {
        let value = numberFormatter.string(from: abs(coordinate.value) as NSNumber)!
        return "\(value)° \(coordinate.type.suffix(for: coordinate.direction))"
    }
}

struct Coordinate {
    var value: Double
    let type: CoordinateType

    fileprivate var direction: CoordinateDirection {
        switch value {
            case 0:
                return .neutral
            case let value where value > 0.0:
                return .positive
            default:
                return .negative
        }
    }
}

enum CoordinateType {
    case latitude, longitude

    fileprivate func suffix(for direction: CoordinateDirection) -> String {
        switch self {
            case .latitude:
                switch direction {
                    case .positive:
                        return GeographicDirection.north.rawValue
                    case .negative:
                        return GeographicDirection.south.rawValue
                    default:
                        return GeographicDirection.equator.rawValue
                }
            case .longitude:
                switch direction {
                    case .positive:
                        return GeographicDirection.east.rawValue
                    case .negative:
                        return GeographicDirection.west.rawValue
                    default:
                        return GeographicDirection.primeMeridian.rawValue
                }
        }
    }
}

private enum CoordinateDirection {
    case positive, negative, neutral
}

private enum GeographicDirection: String {
    case north = "N"
    case south = "S"
    case equator = "Equator"
    case east = "E"
    case west = "W"
    case primeMeridian = "Prime Meridian"
}
