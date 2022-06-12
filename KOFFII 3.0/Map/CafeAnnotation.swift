//
//  CafeAnnotation.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 22.04.21.
//

import MapKit

class CafeAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    let cafe: NewCoffeeModel
    let title: String?
   
    init(cafe: NewCoffeeModel) {
        self.cafe = cafe
        self.title = cafe.name
        self.coordinate = cafe.coordinates
        
        super.init()
    }
}
