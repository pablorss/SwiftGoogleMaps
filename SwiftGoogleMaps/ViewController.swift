//
//  ViewController.swift
//  SwiftGoogleMaps
//
//  Created by Pablo Robles Sánchez on 3/17/15.
//  Copyright (c) 2015 Pablo Robles Sánchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var index : Int? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myArray: NSArray?
        if let path = NSBundle.mainBundle().pathForResource("GeoPList", ofType: "plist") {
            myArray = NSArray(contentsOfFile: path)
        }
        if let arr = myArray {
            // Use your dict here
            var latitud : NSString? = arr[index!].objectForKey("latitud") as NSString
            var longitud : NSString?  = arr[index!].objectForKey("longitud") as NSString
            var camera = GMSCameraPosition.cameraWithLatitude(latitud!.doubleValue,
                longitude:longitud!.doubleValue, zoom: 19)
            var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
            mapView.myLocationEnabled = true
            self.view = mapView
            
            var marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(latitud!.doubleValue, longitud!.doubleValue)
            marker.title = arr[index!].objectForKey("nombre") as String
            marker.snippet = arr[index!].objectForKey("etiqueta") as String
            marker.map = mapView

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

