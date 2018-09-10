//
//  MyAnnotation.swift
//  TabbedExample
//
//  Created by Developer on 9/10/18.
//  Copyright © 2018 Aaron. All rights reserved.
//

import Foundation
import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        self.locationName = locationName
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
