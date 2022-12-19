//
//  ViewController.swift
//  Project 16
//
//  Created by Арсентий Халимовский on 15.12.2022.
//

import UIKit
import MapKit
import WebKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself")
        
        
        mapView.addAnnotations([london, oslo, paris, rome, washington])
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        
        let annotationViewTest = annotationView as! MKPinAnnotationView
        annotationViewTest.pinTintColor = .green
        
        return annotationViewTest
        
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        
        guard let capital = view.annotation as? Capital else { return }
        
        
        let placeName = capital.title
        let placeInfo = capital.info

        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        
//        let webViewController = WebViewController()
//        present(webViewController, animated: true)
    }
    
    
    @IBAction func mapType(_ sender: Any) {
        getTypeOfTheMap()
    }
    
    func getTypeOfTheMap() {
        
//        let ac = UIAlertController(title: "Map", message: "Type", preferredStyle: .alert)
//
//        ac.addAction(UIAlertAction(title: "Satelite", style: .default, handler: { action in
//            self.mapView.mapType = .satellite
//        }))
        
        let ac = UIAlertController(title: "Map", message: "Choose you format", preferredStyle: .actionSheet)
        
        ac.addAction(UIAlertAction(title: "Satelite", style: .default, handler: { ActionHandler in
            self.mapView.mapType = .satellite
        }))
        
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: { ActionHandler in
            self.mapView.mapType = .hybrid
        }))
        ac.addAction(UIAlertAction(title: "Standart", style: .default, handler: { ActionHandler in
            self.mapView.mapType = .standard
        }))
        
        present(ac, animated: true)
    }
    
    
}

