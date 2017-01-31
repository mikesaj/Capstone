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
    // CoreLocation permission status
    var locationAuthStatus: CLAuthorizationStatus = CLLocationManager.authorizationStatus()

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

        // Initialize map
        // Delegate to self
        locationMap.delegate = self
        // Use standard map type
        locationMap.mapType = .standard

        // Centre map with location at launch
        // Get location, span, and region when it is possible
        if let initLocation = locationManager.location {
            let initCoordinates: CLLocationCoordinate2D = initLocation.coordinate
            let initSpan: MKCoordinateSpan = MKCoordinateSpanMake(0.014, 0.014)
            let initRegion: MKCoordinateRegion = MKCoordinateRegionMake(initCoordinates, initSpan)

            // Set initial region on the map
            locationMap.setRegion(initRegion, animated: true)
        }

        // Display the user’s location
        locationMap.showsUserLocation = true
    }

    // MARK: Action
    // Logging button action, set (sender: AnyObject) to change button title
    @IBAction func logLocation(_ sender: AnyObject) {

        // Button strings: "Start", "Stop"
        let startStr: String = NSLocalizedString("log_btn_start", comment: "Start")
        let stopStr: String = NSLocalizedString("log_btn_stop", comment: "Stop")

        // Start logging
        func startLogging() {

            // Request permission
            if locationAuthStatus == .notDetermined {
                locationManager.requestWhenInUseAuthorization()
            }

            // Start updating location and heading
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()

            // Change button title
            sender.setTitle(stopStr, for: .normal)
        }

        // Stop logging
        func stopLogging() {

            // Stop updating location and heading
            locationManager.stopUpdatingLocation()
            locationManager.stopUpdatingHeading()

            // Stop tracking user
            locationMap.userTrackingMode = .none

            // Clear location data
            userLocations.removeAll()

            // Change button title
            sender.setTitle(startStr, for: .normal)

            // Change location information text
            locationData.text = NSLocalizedString("start_inst", comment: "Start instruction")
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

    // MARK: CLLocationManagerDelegate
    // Tells the delegate that the authorization status for the application changed
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

        // Check the status
        switch status {
            case .notDetermined:
                // Do nothing until 'Start' button is tapped
                break
            case .authorizedWhenInUse, .authorizedAlways:
                // Set instruction when it is granted
                locationData.text = NSLocalizedString("start_inst", comment: "Start instruction")
                // Make logging button enable
                logLocation.isEnabled = true
            case .denied, .restricted:
                // Set instruction when it is not granted
                locationData.text = NSLocalizedString("auth_inst", comment: "Authorization instruction")
                // Make logging button disable
                logLocation.isEnabled = false
        }
    }

    // Tell the delegate that new location data is available
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        // The map follows the user location and rotates when the heading changes
        locationMap.userTrackingMode = .followWithHeading

        // Get current location data
        if let lastLocation = locations.last {
            // Show location data on the label
            locationData.text = "\(lastLocation)"
            // Append the data to userLocations Array
            userLocations.append(lastLocation)
        }

        // Make user route as polyline
        // Check the array has 2 elements to draw a line
        if (userLocations.count > 1) {
            // Create coordinates array for MKPolyline
            var coords: Array<CLLocationCoordinate2D> = Array()
            // Append two coordinates to the array
            for location in userLocations { coords.append(location.coordinate) }

            // Create MKPolyline object from the specified set of coordinates
            let polyline: MKPolyline = MKPolyline(coordinates: coords, count: coords.count)

            // Add the polyline as single overlay object to the map
            locationMap.add(polyline)

            // Remove the first element to limit size of the array
            userLocations.removeFirst()
        }
    }

    // MARK: MKMapViewDelegate
    // Ask the delegate for a renderer object to use when drawing the specified overlay
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

        // Initialize and return a new overlay view using the specified polyline overlay object
        let polylineRenderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        // Set stroke line colour
        polylineRenderer.strokeColor = UIColor.blue
        // Set stroke line width
        polylineRenderer.lineWidth = 4

        return polylineRenderer
    }
}
