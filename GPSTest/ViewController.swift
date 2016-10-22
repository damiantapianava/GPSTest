//
//  ViewController.swift
//  GPSTest
//
//  Created by Infraestructura on 22/10/16.
//  Copyright © 2016 Infraestructura. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate
{

    @IBOutlet weak var txtLatitude: UITextField!
    @IBOutlet weak var txtLongitud: UITextField!
    
    var localizador : CLLocationManager?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.localizador = CLLocationManager()
        self.localizador!.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.localizador!.delegate = self
        
        self.localizador!.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        self.localizador!.stopUpdatingLocation()
        
        let ac = UIAlertController(title: "Error", message: "No se puede obtener lecturas del GPS", preferredStyle: .Alert)
        
        let ab = UIAlertAction(title: "ERROR", style: .Default, handler: nil)
        
        ac.addAction(ab)

        self.presentViewController(ac, animated: true, completion: nil)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let ubicacion = locations.last
        
        self.txtLatitude.text = "\(ubicacion!.coordinate.latitude)"
        self.txtLatitude.text = "\(ubicacion!.coordinate.longitude)"
        
        
    }

}

