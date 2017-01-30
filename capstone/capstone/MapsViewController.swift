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

    // MARK: viewDidLoad
    override func viewDidLoad() {

        super.viewDidLoad()
    }

    // MARK: Action
    @IBAction func logLocation(_ sender: AnyObject) {

    }
}
