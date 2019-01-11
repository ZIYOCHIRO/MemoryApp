//
//  ActivityModel.swift
//  Memory
//
//  Created by 10.12 on 2019/1/10.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

struct ActivityModel {
    var id: String!
    var title = ""
    var subtitle = ""
    var activityType: ActivityType
    var photo: UIImage?
    
    init(title: String, subtitle: String, activityType: ActivityType, photo: UIImage? = nil) {
        self.id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        self.activityType = activityType
        self.photo = photo
    }
}
