//
//  TripFunctions.swift
//  Memory
//
//  Created by 10.12 on 2019/1/5.
//  Copyright © 2019 Rui. All rights reserved.
//

import Foundation

class TripFunctions {
    // CRUD: create, read, update, delete
    
    static func createTrip(tripModel: TripModel) {
        
    }
    
    static func readTrips(completion:@escaping () -> ()) {
        // 1st-this code will be called on the background thread
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to Bail!"))
                Data.tripModels.append(TripModel(title: "Mexico"))
                Data.tripModels.append(TripModel(title: "Russian Trip"))
            }
            // 2nd-the completion function will be called
            DispatchQueue.main.async {
                completion()
            }
        }
        
    }
    
    static func updateTrip(tripModel: TripModel) {
        
    }
    
    static func deleteTrip(tripModel: TripModel) {
        
    }
}
