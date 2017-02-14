//
//  CustomTableViewCell.swift
//  Forecast
//
//  Created by Tim on 14.02.17.
//  Copyright © 2017 Oleg Marchik. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var temperatureLabel: UITextField!
    @IBOutlet weak var pictureLabel: UIImageView!
    @IBOutlet weak var dayLabel: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
