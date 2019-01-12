//
//  TripFunctions.swift
//  Memory
//
//  Created by 10.12 on 2019/1/5.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

class TripFunctions {
    // CRUD: create, read, update, delete
    
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
    }
    
    static func readTrips(completion:@escaping () -> ()) {
       // Replace with real data store code
        DispatchQueue.global(qos: .userInitiated).async {
            if Data.tripModels.count == 0 {
                Data.tripModels = MockData.createMockTripModelData()
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    static func readTrips(by id: UUID, completion:@escaping (TripModel?) -> ()) {
        // 1st-this code will be called on the background thread
        DispatchQueue.global(qos: .userInteractive).async {
            let trip = Data.tripModels.first(where: { $0.id == id })
            // 2nd-the completion function will be called
            DispatchQueue.main.async {
                completion(trip)
            }
        }
    }
    
    static func updateTrip(at index: Int, title: String, image: UIImage? = nil) {
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
        
    }
    
    static func deleteTrip(index: Int) {
        Data.tripModels.remove(at: index)
    }
}
