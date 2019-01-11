//
//  ActivityTableViewCell.swift
//  Memory
//
//  Created by 10.12 on 2019/1/11.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var activityImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addShadowAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.bodyFontNameDemiBold, size: 17)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 17)
        
    }
    
    func setup(activityModel: ActivityModel) {
        titleLabel.text = activityModel.title
        activityImageView.image = getActivityImageView(type: activityModel.activityType)
        subtitleLabel.text = activityModel.subtitle
    }
    
    func getActivityImageView(type: ActivityType) -> UIImage? {
        switch type {
        case .auto:
            return #imageLiteral(resourceName: "Car")
        case .excursion:
            return #imageLiteral(resourceName: "Excursion")
        case .flight:
            return #imageLiteral(resourceName: "Flight")
        case .food:
            return #imageLiteral(resourceName: "Food")
        case .hotel:
            return #imageLiteral(resourceName: "Hotel")
        }
    }

}
