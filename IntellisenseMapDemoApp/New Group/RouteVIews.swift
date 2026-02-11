//
//  RouteVIews.swift
//  IntellisenseMapDemoApp
//
//  Created by Suraj Parshad on 11/02/26.
//

import Foundation
import SwiftUI
import MapKit
import UIKit

struct MapView: UIViewRepresentable {
typealias UIViewType = MKMapView

@Binding var directions: [String]

func makeCoordinator() -> MapViewCoordinator {
    return MapViewCoordinator()
}

func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView()

    mapView.delegate = context.coordinator
    mapView.showsUserLocation = true

    let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.58393, longitude: 19.52201), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    mapView.setRegion(region, animated: true)

    let locationManager = CLLocationManager()
    locationManager.requestWhenInUseAuthorization()

    if CLLocationManager.locationServicesEnabled() {
        locationManager.delegate = context.coordinator
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }

    // Prijepolje
    let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 43.000000, longitude: -75.000000))

    let request = MKDirections.Request()

    request.source = MKMapItem.forCurrentLocation()
    request.destination = MKMapItem(placemark: p2)
    request.transportType = .automobile

    let directions = MKDirections(request: request)

    directions.calculate { response, error in
        guard let route = response?.routes.first else {
            return
        }
        mapView.addAnnotations([p2])
        mapView.addOverlay(route.polyline)
        mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated: true)
        self.directions = route.steps.map { $0.instructions }.filter {
            !$0.isEmpty
        }
    }

    return mapView
}

func updateUIView(_ uiView: MKMapView, context: Context) {

}

class MapViewCoordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer  = MKPolylineRenderer(overlay: overlay)

        renderer.strokeColor = .blue
        renderer.lineWidth = 5
        return renderer
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            // Do something with the updated location if needed
        }
    }
}
}

