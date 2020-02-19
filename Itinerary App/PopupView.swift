//
//  PopupView.swift
//  Itinerary App
//
//  Created by Hany Karam on 2/15/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
class PopuUIView:UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
        
    }
}
