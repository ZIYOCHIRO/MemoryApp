//
//  UIButtonExtensions.swift
//  Memory
//
//  Created by 10.12 on 2019/1/6.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

extension UIButton {
    
    func createFloatingActionButton() {
        
        
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10 )
    }
}
