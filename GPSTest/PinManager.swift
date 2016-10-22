//
//  File.swift
//  GPSTest
//
//  Created by Infraestructura on 22/10/16.
//  Copyright © 2016 Infraestructura. All rights reserved.
//

import Foundation
import MapKit

public class PinManager:NSObject, MKAnnotation
{
    public var title: String?
    public var subtitle: String?
    
    public let coordinate: CLLocationCoordinate2D
    
    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D)
    {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
        super.init()
    }
}