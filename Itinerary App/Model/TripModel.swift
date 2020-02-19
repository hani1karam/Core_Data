//
//  TripModel.swift
//  Itinerary App
//
//  Created by Hany Karam on 2/14/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
import UIKit
class TripModel{
    let id:UUID
    var tite:String
    var imae:UIImage?
    init(title:String, image:UIImage? = nil ) {
        id = UUID()
        self.tite =  title
        self.imae = image
    }
}
