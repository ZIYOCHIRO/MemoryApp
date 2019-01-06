//
//  AppUIButton.swift
//  Memory
//
//  Created by 10.12 on 2019/1/6.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
    }

}
