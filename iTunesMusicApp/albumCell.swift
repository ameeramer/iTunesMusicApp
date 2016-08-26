//
//  albumCell.swift
//  iTunesMusicApp
//
//  Created by Ameer Amer on 26/08/2016.
//  Copyright © 2016 Ameer Amer. All rights reserved.
//

import UIKit

class albumCell: UITableViewCell {

    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artwork: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
