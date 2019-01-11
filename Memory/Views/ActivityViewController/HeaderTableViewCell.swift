//
//  HeaderTableViewCell.swift
//  Memory
//
//  Created by 10.12 on 2019/1/11.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 17)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 15)
    }
    
    func setup(daymodel: DayModel) {
        titleLabel.text = daymodel.title
        subtitleLabel.text = daymodel.subtitle
    }
   

}
