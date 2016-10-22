//
//  ViewController.swift
//  GPSTest
//
//  Created by Infraestructura on 22/10/16.
//  Copyright © 2016 Infraestructura. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate
{

    @IBOutlet weak var txtLatitude: UITextField!
    @IBOutlet weak var txtLongitud: UITextField!
    @IBOutlet weak var elMapa: MKMapView!
    
    var localizador : CLLocationManager?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.localizador = CLLocationManager()
        self.localizador!.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.localizador!.delegate = self
        
        let autorizado = CLLocationManager.authorizationStatus()
        
        if autorizado == CLAuthorizationStatus.NotDetermined
        {
            self.localizador!.requestWhenInUseAuthorization()
        }
        
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
        
        self.colocarMapa(ubicacion!)
    }
    
    func colocarMapa(ubicacion: CLLocation)
    {
        let laCoordenada = ubicacion.coordinate
        
        let region = MKCoordinateRegionMakeWithDistance(laCoordenada, 1000, 1000)
        
        self.elMapa.setRegion(region, animated: true)
        
        let losPines = self.elMapa.annotations
        
        self.elMapa.removeAnnotations(losPines)
        
        let elPin = PinManager(title:"Usted está aqui", subtitle:"", coordinate:laCoordenada)
        
        self.elMapa.addAnnotation(elPin)
    }

}

