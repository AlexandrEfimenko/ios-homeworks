//
//  MapLocationViewController.swift
//  Navigation
//
//  Created by Александр Ефименко on 19.11.2024.
//

import UIKit
import MapKit
import CoreLocation

class MapLocationViewController: UIViewController  {
    var locationManager = CLLocationManager()
    var mapView = MKMapView()

    private lazy var removeAnnotationButton: UIButton = {
        let view = UIButton()
            //view.frame = CGRect(x: 300, y: 100, width: 200, height: 20)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .systemBackground
            view.setTitle("Удалить все точки", for: .normal)
            view.setTitleColor(.systemBlue, for: .normal)
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.systemBlue.cgColor
            view.layer.cornerRadius = 15

            view.addTarget(self, action: #selector(removeAnnotattionButton), for: .touchUpInside)
           return view
       }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        mapView.mapType = .standard
        mapView.showsUserLocation = true
        mapView.showsUserTrackingButton = true
        mapView.delegate = self
        mapView.showsScale = true


        view.addSubview(self.mapView)
        view.addSubview(self.removeAnnotationButton)

        locationManager.requestWhenInUseAuthorization()

        let lpg = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress))
        mapView.addGestureRecognizer(lpg)

    }

    func addAnotation(center: CLLocationCoordinate2D, title: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = title
        annotation.subtitle = "маршрут сюда"

        mapView.addAnnotation(annotation)
    }

    @objc func didLongPress(_ gesture: UILongPressGestureRecognizer) {
        let point = gesture.location(in: mapView)
        let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
        addAnotation(center: coordinate, title: "Новая точка (нажмите чтобы проложить маршрут)")

    }

    @objc func removeAnnotattionButton() {
        self.mapView.removeAnnotations(self.mapView.annotations)
    }
}


extension MapLocationViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {

       if let annotation = view.annotation {
           creatRoute(annotation: annotation)
       }
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: any MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let render = MKPolylineRenderer(overlay: overlay)
            render.lineWidth = 10
            render.strokeColor = .cyan
            return render
        }

        return MKPolylineRenderer()
    }


    func creatRoute(annotation: MKAnnotation) {

        if let userLocation = locationManager.location {

            let destinationCoordinate = annotation.coordinate
            let sourceCoordinate = userLocation.coordinate

            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceCoordinate))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate))

            let direction = MKDirections(request: request)

            direction.calculate { [weak self] response, error in
                if let response, let route = response.routes.first {
                    self?.mapView.addOverlay(route.polyline)
                    self?.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                }
            }

        }
    }
}

