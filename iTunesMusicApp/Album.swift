//
//  Artist.swift
//  iTunesMusicApp
//
//  Created by Ameer Amer on 25/08/2016.
//  Copyright © 2016 Ameer Amer. All rights reserved.
//

import Foundation

struct Album {
    let albumName: String
    let artworkPath: String
}

extension Album: JSONDecodable {
    init?(JSON: [String : AnyObject]) {
        guard let name = JSON["collectionName"] as? String, path = JSON["artworkUrl60"] as? String else {
            return nil
        }
        
        self.albumName = name
        self.artworkPath = path
    }
}