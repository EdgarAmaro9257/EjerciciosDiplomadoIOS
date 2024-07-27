//
//  PizzeriaListView.swift
//  PizzasApp
//
//  Created by Diplomado on 27/07/24.
//

import SwiftUI
import MapKit

struct Pizzeria: Identifiable {
    var id = UUID()
    var name: String
    var location: CLLocationCoordinate2D
}

struct PizzeriaListView: View {
    let pizzerias = [
        Pizzeria(name: "Copilco", location: CLLocationCoordinate2D(latitude: 19.332, longitude: -99.194)),
        Pizzeria(name: "Coyoacán", location: CLLocationCoordinate2D(latitude: 19.355, longitude: -99.163))
    ]
    
    var body: some View {
        NavigationView {
            List(pizzerias) { pizzeria in
                NavigationLink(destination: PizzeriaMapView(pizzeria: pizzeria)) {
                    Text(pizzeria.name)
                }
            }
            .navigationTitle("Pizzerías")
        }
    }
}

struct PizzeriaMapView: View {
    let pizzeria: Pizzeria
    
    @State private var region: MKCoordinateRegion
    
    init(pizzeria: Pizzeria) {
        self.pizzeria = pizzeria
        _region = State(initialValue: MKCoordinateRegion(
            center: pizzeria.location,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
    }
    
    var body: some View {
        MapView(pizzeria: pizzeria)
            .edgesIgnoringSafeArea(.all)
            .navigationTitle(pizzeria.name)
    }
}

struct MapView: UIViewRepresentable {
    let pizzeria: Pizzeria
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let request = MKDirections.Request()
        let currentLocation = CLLocationCoordinate2D(latitude: 19.340, longitude: -99.180) // Reemplaza con la ubicación actual o obtenla dinámicamente.
        let source = MKPlacemark(coordinate: currentLocation)
        let destination = MKPlacemark(coordinate: pizzeria.location)
        
        request.source = MKMapItem(placemark: source)
        request.destination = MKMapItem(placemark: destination)
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        
        directions.calculate { response, error in
            guard let route = response?.routes.first else {
                print("Error calculating route: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            uiView.addOverlay(route.polyline)
            uiView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
        }
        
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotation(MKPlacemark(coordinate: pizzeria.location))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let routeOverlay = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: routeOverlay)
                renderer.strokeColor = .blue
                renderer.lineWidth = 3.0
                return renderer
            }
            return MKOverlayRenderer()
        }
    }
}

struct PizzeriaListView_Previews: PreviewProvider {
    static var previews: some View {
        PizzeriaListView()
    }
}





