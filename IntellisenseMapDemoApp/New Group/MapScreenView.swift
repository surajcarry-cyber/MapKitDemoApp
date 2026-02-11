//
//  MapScreenView.swift
//  IntellisenseMapDemoApp
//
//  Created by Suraj Parshad on 11/02/26.
//


import SwiftUI
import MapKit

struct MapScreenView: View {

    @StateObject private var viewModel = MapViewModel()

    var body: some View {

        Map(position: $viewModel.cameraPosition) {
            UserAnnotation()

            //  POIs
            ForEach(viewModel.pois) { poi in
                Annotation(poi.name,
                           coordinate: poi.coordinate) {

                    Image(systemName: poi.type.systemImage)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(poi.type.color, in: Circle())
                        .onTapGesture {
                            Task {
                                await viewModel.getDirections(to: poi)
                            }
                        }
                }
            }

            // Route Polyline
            if let route = viewModel.route {
                MapPolyline(route.polyline)
                    .stroke(.pink, lineWidth: 6)
            }
        }
        .mapStyle(.hybrid(elevation: .realistic))
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            MapScaleView()
        }
        .onAppear {
            viewModel.locationManager.requestPermission()
        }
    }
}
