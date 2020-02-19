//
//  TripTableViewCell.swift
//  Itinerary App
//
//  Created by Hany Karam on 2/15/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.addShadowAnRoundedConrners()
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = CGSize.zero
        cardView.layer.shadowColor = UIColor.darkGray.cgColor
        cardView.layer.cornerRadius = 10
        tripImageView.layer.cornerRadius  = cardView.layer.cornerRadius
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(tripModel:TripModel){
        label.text = tripModel.tite
        tripImageView.image = tripModel.imae
    }
 }
