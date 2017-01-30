//
//  MapsViewController.swift
//  capstone
//
//  Created by Joohyung Ryu on 2017. 1. 29..
//  Copyright © 2017 MSD. All rights reserved.
//

/*
    Imports:
    * MapKit(MKMapViewDelegate) - Use map view to show current location on it
    * CoreLocation(CLLocationManagerDelegate) - Get current locations
*/
import UIKit
import MapKit
import CoreLocation

class MapsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    // MARK: Properties
    // Main map view
    @IBOutlet weak var locationMap: MKMapView!
    // UILabel for displaying location data
    @IBOutlet weak var locationData: UILabel!
    // Start/Stop button for logging the location
    @IBOutlet weak var logLocation: UIButton!

    // MARK: Variables
    // Location manager
    var locationManager: CLLocationManager!
    // Empty CLLocation array for path drawing
    var userLocations: Array<CLLocation> = Array()

    // MARK: viewDidLoad
    override func viewDidLoad() {

        super.viewDidLoad()

        // Initialize location manager
        // Crate CLLocationManager object
        locationManager = CLLocationManager()
        // Delegate to self
        locationManager.delegate = self
        // Use best accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // Request location use permission
        locationManager.requestWhenInUseAuthorization()
        // Start updating location and heading
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()

        // Initialize map
        // Delegate to self
        locationMap.delegate = self
        // Use standard map type
        locationMap.mapType = .standard
        // Display the user’s location
        locationMap.showsUserLocation = true
        // The map follows the user location and rotates when the heading changes
        locationMap.userTrackingMode = .followWithHeading
    }

    // MARK: Action
    // Logging button action, set (sender: AnyObject) to change button title
    @IBAction func logLocation(_ sender: AnyObject) {

        // Button strings: "Start", "Stop"
        let startStr: String = NSLocalizedString("log_btn_start", comment: "Start")
        let stopStr: String = NSLocalizedString("log_btn_stop", comment: "Stop")

        // Start logging
        func startLogging() {

            // Change button title
            sender.setTitle(stopStr, for: .normal)

        }

        // Stop logging
        func stopLogging() {

            // Change button title
            sender.setTitle(startStr, for: .normal)
        }

        // Change logging status by button title
        switch (sender.currentTitle as String!) {
            case startStr:
                // When "Start" tapped
                startLogging()
            case stopStr:
                // When "Stop" tapped
                stopLogging()
            default:
                break
        }
    }
}
