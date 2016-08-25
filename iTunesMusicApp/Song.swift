//
//  Song.swift
//  iTunesMusicApp
//
//  Created by Ameer Amer on 25/08/2016.
//  Copyright © 2016 Ameer Amer. All rights reserved.
//

import Foundation
import UIKit


class Song: JSONDecodable {
    let songName: String
    let artistName: String
    let artworkPath: String
    
    required init?(JSON: [String : AnyObject]) {
        guard let song = JSON["feed"]?["entry"]?["im:name"]?["label"] as? String else {
            return nil
        }
    }
}