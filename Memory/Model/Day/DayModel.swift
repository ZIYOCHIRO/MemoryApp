//
//  DayModel.swift
//  Memory
//
//  Created by 10.12 on 2019/1/10.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

struct DayModel {
    var id: String!
    var title = ""
    var subtitle = ""
    var activityModels = [ActivityModel]()
    
    init(title: String, subtitle: String, activityModels: [ActivityModel]?) {
        self.id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        
        if let activityModels = activityModels {
            self.activityModels = activityModels
        }
    }
}
