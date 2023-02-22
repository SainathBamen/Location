//
//  ViewController.swift
//  Location
//
//  Created by sainath bamen on 10/02/23.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var MyMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }


}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinates: CLLocationCoordinate2D = manager.location!.coordinate
        let spanDegree = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.05)
        
        
        let region = MKCoordinateRegion(center: coordinates, span: spanDegree)
        MyMap.setRegion(region, animated: true)
        MyMap.showsUserLocation = true
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        annotation.title = "Your are here"
        MyMap.addAnnotation(annotation)
        
    }
}

