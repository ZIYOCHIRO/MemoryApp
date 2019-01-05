//
//  TripModel.swift
//  Memory
//
//  Created by 10.12 on 2019/1/5.
//  Copyright © 2019 Rui. All rights reserved.
//

import Foundation

class TripModel {
    var id: String!
    var title: String! //required
    
    init(title: String) {
        self.id = UUID().uuidString
        self.title = title
    }
}
