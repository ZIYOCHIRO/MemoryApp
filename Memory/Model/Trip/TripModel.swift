//
//  TripModel.swift
//  Memory
//
//  Created by 10.12 on 2019/1/5.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

class TripModel {
    var id: UUID
    var title: String //required
    var image: UIImage?
    
    init(title: String, image: UIImage? = nil) {
        self.id = UUID()
        self.title = title
        self.image = image
    }
}
