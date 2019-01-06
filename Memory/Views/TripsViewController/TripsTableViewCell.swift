//
//  TripsTableViewCell.swift
//  Memory
//
//  Created by 10.12 on 2019/1/5.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        cardView.addShadowAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
        cardView.backgroundColor = Theme.accent
        titleLabel.textColor = Theme.tint
        
        
        
    }
    
    func setUp(tripModel: TripModel) {
        titleLabel.text = tripModel.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
