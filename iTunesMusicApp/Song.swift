//
//  Song.swift
//  iTunesMusicApp
//
//  Created by Ameer Amer on 25/08/2016.
//  Copyright © 2016 Ameer Amer. All rights reserved.
//

import Foundation
import UIKit

extension CollectionType {
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Generator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

struct Song {
    let songName: String
    let artistName: String
    let artworkPath: String
}

extension Song: JSONDecodable {
     init?(JSON: [String : AnyObject]) {
        guard let nameDict = JSON["im:name"] as? [String: AnyObject], name = nameDict["label"] as? String, imgArr = JSON["im:image"] as? [[String: AnyObject]], img60Dict = imgArr[safe: 1], image = img60Dict["label"] as? String, artistDict = JSON["im:artist"] as? [String: AnyObject], artist = artistDict["label"] as? String else {
            return nil
        }
        self.songName = name
        self.artworkPath = image
        self.artistName = artist
    }
}