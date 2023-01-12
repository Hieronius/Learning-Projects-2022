//
//  ViewController.swift
//  Project 22
//
//  Created by Арсентий Халимовский on 10.01.2023.
//

import CoreLocation
import UIKit



class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var distanceReading: UILabel!
    var locationManager: CLLocationManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        
        view.backgroundColor = .gray
    }

    func locationManager(_ manager: CLLocationManager, didChangeAutorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
    }
    }
    
    func startScanning() {
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 123, minor: 456, identifier: "MyBeacon")
        
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(in: beaconRegion)
    }
    
    func updage(distance: CLProximity) {
        UIView.animate(withDuration: 1) {
            switch distance {
            
        case .far:
            self.view.backgroundColor = .blue
            self.distanceReading.text = "FAR"
            
        case .near:
            self.view.backgroundColor = .orange
            self.distanceReading.text = "NEAR"
            
        case .immediate:
            self.view.backgroundColor = .red
            self.distanceReading.text = "RIGHT HERE"
                
            default:
                self.view.backgroundColor = .gray
                self.distanceReading.text = "UNKNOWN"
        }
    }
}
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if let beacon = beacons.first {
            updage(distance: beacon.proximity)
        } else {
            updage(distance: .unknown)
        }
    }
    
}

