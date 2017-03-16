//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by Baskaran T on 16/03/17.
//  Copyright © 2017 Baskaran T. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundShadowView: UIView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherDescLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var chanceOfRainLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundShadowView.backgroundColor = UIColor.white
        backgroundShadowView.layer.masksToBounds = false
        backgroundShadowView.layer.cornerRadius = 3.0
        backgroundShadowView.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        backgroundShadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
        backgroundShadowView.layer.shadowOpacity = 0.3
        backgroundShadowView.layer.shadowRadius = 3.0
        
        chanceOfRainLabel.layer.masksToBounds = true
        chanceOfRainLabel.layer.cornerRadius = chanceOfRainLabel.frame.size.height/2
        
        
        
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: self.contentView.bounds.width - 16, height: backgroundShadowView.frame.height))
        backgroundShadowView.layer.shadowPath = shadowPath.cgPath
    }
    

}
