//
//  ViewController.swift
//  RouteTestTask_YouTube
//
//  Created by Арсентий Халимовский on 26.08.2022.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    let addAddressButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addAdress"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    let routeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "route"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
        
    }()
    
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "reset"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
        
    }()
    
    var annotationArray = [MKPointAnnotation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setConstraints()
        
        addAddressButton.addTarget(self, action: #selector(addAdressButtonTapped), for: .touchUpInside)
        routeButton.addTarget(self, action: #selector(addAdressButtonTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(addAdressButtonTapped), for: .touchUpInside)
    }
    
    @objc func addAdressButtonTapped() {
        alertAddAdress(title: "Добавить", placeholder: "Введите адрес") { [self] (text) in
            setupPlacemark(adressPlace: text)
        }
        
    }
    
    @objc func routeButtonTapped() {
        print("TapRoute")
    }
    
    @objc func resetButtonTapped() {
        print("TapReset")
    }
    
    private func setupPlacemark(adressPlace: String) {
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(adressPlace) { [self] (placemarks, error) in
            
            if let error = error {
                print(error)
                alertError(title: "Ошибка", message: "Сервер недоступен. Попробуйте добавить адрес еще раз")
                return
            }
            
            guard let placemarks = placemarks else { return }
            let placemark = placemarks.first
            
            let annotation = MKPointAnnotation()
            annotation.title = "\(adressPlace)"
            guard let placemarkLocation = placemark?.location else { return }
            annotation.coordinate = placemarkLocation.coordinate
            
            annotationArray.append(annotation)
            
            if annotationArray.count > 2 {
                routeButton.isHidden = false
                resetButton.isHidden = false
            }
            
            mapView.showAnnotations(annotationArray, animated: true)
        }
    }
    
    private func createDirectionRequest(startCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        
        let startLocation = MKPlacemark(coordinate: startCoordinate)
        let destionationLocation = MKPlacemark(coordinate: destinationCoordinate)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startLocation)
        request.destination = MKMapItem(placemark: destionationLocation)
        request.transportType = .walking
        request.requestsAlternateRoutes = true
        
        let diraction = MKDirections(request: request)
        diraction.calculate { (responce, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let responce = responce else {
                self.alertError(title: "Ошибка", message: "Маршрут недоступен")
                return
            }
            
            var minRoute = responce.routes[0]
            for route in responce.routes {
                minRoute = (route.distance < minRoute.distance) ? route : minRoute
            }
        }
    }
}

extension ViewController {
    
    func setConstraints() {
        
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        mapView.addSubview(addAddressButton)
        NSLayoutConstraint.activate([
            addAddressButton.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 50),
            addAddressButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
            addAddressButton.heightAnchor.constraint(equalToConstant: 70),
            addAddressButton.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        mapView.addSubview(routeButton)
        NSLayoutConstraint.activate([
            routeButton.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 20),
            routeButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -30),
            routeButton.heightAnchor.constraint(equalToConstant: 50),
            routeButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        mapView.addSubview(resetButton)
        NSLayoutConstraint.activate([
            resetButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
            resetButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -30),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}


