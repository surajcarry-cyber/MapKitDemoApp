//
//  Poi.swift
//  IntellisenseMapDemoApp
//
//  Created by Suraj Parshad on 11/02/26.
//

import Foundation
import MapKit
import SwiftUI

struct POI: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let type: POIType
}

enum POIType {
    case restaurant
    case hospital
    case petrolPump
    case cafe

    var systemImage: String {
        switch self {
        case .restaurant: return "fork.knife"
        case .hospital: return "cross.case.fill"
        case .petrolPump: return "fuelpump.fill"
        case .cafe: return "cup.and.saucer.fill"
        }
    }

    var color: Color {
        switch self {
        case .restaurant: return .orange
        case .hospital: return .red
        case .petrolPump: return .blue
        case .cafe: return .brown
        }
    }
}

