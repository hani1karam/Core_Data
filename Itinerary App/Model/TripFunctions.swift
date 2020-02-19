//
//  TripFunctions.swift
//  Itinerary App
//
//  Created by Hany Karam on 2/14/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
class TripFunctions{
    static func creatTrip(tripModel: TripModel){
       Data.tripModels.append(tripModel)
    }
    static func readTrips(complection: @escaping () -> ()){
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip To Bali!"))
                Data.tripModels.append(TripModel(title: "Mexico"))
                Data.tripModels.append(TripModel(title: "Russian Trip"))
                
                
            }
        }
        DispatchQueue.main.async {
            complection()
        }
        
    }
    static func updateTrip(tripModel: TripModel){
        
    }
    static func deleteTrip(Index: Int)
    {
        Data.tripModels.remove(at: Index)
    }
    
}
