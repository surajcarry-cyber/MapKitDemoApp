//
//  MapViewModel.swift
//  IntellisenseMapDemoApp
//
//  Created by Suraj Parshad on 11/02/26.

import Foundation
import MapKit
import SwiftUI

@MainActor
class MapViewModel: ObservableObject {

    @Published var cameraPosition: MapCameraPosition = .automatic
    @Published var route: MKRoute?
    @Published var selectedPOI: POI?

    let locationManager = LocationManager()

    // Mock POIs (You can replace with dynamic fetch)
    @Published var pois: [POI] = [
        POI(
            name: "Restaurant",
            coordinate: CLLocationCoordinate2D(latitude: 28.6219, longitude: 77.3809),
            type: .restaurant
        ),
        POI(
            name: "Hospital",
            coordinate: CLLocationCoordinate2D(latitude: 28.6207, longitude: 77.3698),
            type: .hospital
        ),
        POI(
            name: "Petrol Pump",
            coordinate: CLLocationCoordinate2D(latitude: 28.6195, longitude: 77.3780),
            type: .petrolPump
        ),
        POI(
            name: "Cafe",
            coordinate: CLLocationCoordinate2D(latitude: 28.6230, longitude: 77.3740),
            type: .cafe
        )
    ]

    // MARK: - Route Drawing

    func getDirections(to poi: POI) async {

        guard let userLocation = locationManager.userLocation else { return }

        selectedPOI = poi

        let request = MKDirections.Request()
        request.source = MKMapItem(
            placemark: MKPlacemark(coordinate: userLocation)
        )

        request.destination = MKMapItem(
            placemark: MKPlacemark(coordinate: poi.coordinate)
        )

        request.transportType = .automobile

        do {
            let response = try await MKDirections(request: request).calculate()

            if let route = response.routes.first {
                self.route = route
                self.cameraPosition = .rect(route.polyline.boundingMapRect)
            }

        } catch {
            print("Routing Error: \(error)")
        }
    }
}
