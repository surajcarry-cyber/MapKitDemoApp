////
////  ContentView.swift
////  IntellisenseMapDemoApp
////
////  Created by Suraj Parshad on 11/02/26.
////
//
//import SwiftUI
//import MapKit
//
//struct ContentView: View {
//    var body: some View {
////        if #available(macOS 14.0, *) {
////            Map()
////            UserAnnotation()
////        } else {
////            // Fallback on earlier versions
////        }
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}
//
//iOS Map Task – POIs & Route Drawing
//📌 Objective
//Create an iOS application that displays Points of Interest (POIs) on a map.
//When the user taps on any POI, a route (polyline) should be drawn from the user’s current
//location to the selected POI.
//🧰 Technical Requirements
//1⃣ Platform & Language
//• iOS
//• Swift or SwiftUI (candidate’s choice)
//2⃣ Maps SDK
//• Can use any map provider:
//o Apple Maps
//o Google Maps
//o Tomtom Maps
//• No restriction on POI source (native SDK, local search, or mock data).
//3⃣ Architecture
//• MVVM (Mandatory)
//• Clear separation of:
//o View
//o ViewModel
//o Model
//🗺 Functional Requirements
//A. Map & Location
//• Request and handle location permission
//• Fetch and display current user location on the map
//B. Points of Interest (POIs)
//• Display multiple POIs on the map:
//o Examples: restaurants, petrol pumps, hospitals, cafes
//• POIs should appear as map markers/annotations
//• POIs can be:
//o Fetched dynamically (preferred), or
//o Hardcoded/mock data (acceptable)
//C. Interaction
//• When the user taps on a POI marker:
//o Draw a polyline/route from current location to the selected POI
//o Update route if a different POI is selected
//D. Route Handling
//• Use:
//o Apple Maps routing (MKDirections) OR
//o Any routing mechanism provided by the chosen map SDK
//• Route should be visually clear on the map
