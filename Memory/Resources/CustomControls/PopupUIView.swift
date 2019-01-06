//
//  PopupUIView.swift
//  Memory
//
//  Created by 10.12 on 2019/1/6.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

class PopupUIView: UIView {
    // init(initializer) - called one time on control creation
    // draw - can be called multiple times to refresh control
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 15
        
        backgroundColor = Theme.background
    }
 
}
