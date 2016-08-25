//
//  SongCell.swift
//  iTunesMusicApp
//
//  Created by Ameer Amer on 25/08/2016.
//  Copyright © 2016 Ameer Amer. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var artwork: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
