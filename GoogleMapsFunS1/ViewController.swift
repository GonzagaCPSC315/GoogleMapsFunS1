//
//  ViewController.swift
//  GoogleMapsFunS1
//
//  Created by Gina Sprint on 11/23/20.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // we need the GU coordinates to initially setup our map zoomed into GU
        let guLatitude = 47.6670357
        let guLongitude = -117.403623
        // now we need a "camera" to zoom our map into these coordinates
        let guCamera = GMSCameraPosition.camera(withLatitude: guLatitude, longitude: guLongitude, zoom: 15.0)
        // zoom level 1.0 "world view" 20.0 "building view"
        // now we need a map to zoom into
        let mapView = GMSMapView.map(withFrame: view.bounds, camera: guCamera)
        
        // change the map type
        mapView.mapType = .hybrid
        
        // add a marker to the map for GU
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: guLatitude, longitude: guLongitude)
        marker.map = mapView
        // if the marker has a title or a snippet, then clicking on it will show a little info window
        marker.title = "Gonzaga University"
        marker.snippet = "Go Zags!"
        marker.icon = GMSMarker.markerImage(with: .green)
        
        // enable "My Location"
        mapView.isMyLocationEnabled = true // show the blue dot
        mapView.settings.myLocationButton = true
        // the above won't work without the user's permission
        // e.g. set up the appropriate key value pair in Info.plist
        
        // challenge tasks:
        // 1. set up delegation for the map view so that your view controller knows when the user taps on the blue my location dot
        // 2. use the Google Places SDK for iOS, show an alert with the current place name and address whe the user taps on their my location blue dot
        
        view = mapView
    }


}

