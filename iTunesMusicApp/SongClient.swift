//
//  SongClient.swift
//  iTunesMusicApp
//
//  Created by Ameer Amer on 26/08/2016.
//  Copyright © 2016 Ameer Amer. All rights reserved.
//

import Foundation

enum SongEndPoint: Endpoint {
    case TopTracks
    
    var baseURL: String {
        return "https://itunes.apple.com"
    }
    
    var path: String {
        switch self {
        case .TopTracks: return "/us/rss/topsongs/limit=50/explicit=true/json"
        }
    }
    var parameters: [String: AnyObject] {
        return [:]
    }
}

final class SongClient: APIClient {
    let configuration: NSURLSessionConfiguration
    
    lazy var session: NSURLSession = {
        return NSURLSession(configuration: self.configuration)
    }()
    
    init(config: NSURLSessionConfiguration) {
        self.configuration = config
    }
    
    convenience init() {
        self.init(config: .defaultSessionConfiguration())
    }
    
    func fetchTracks(completion: APIResult<[Song]> -> Void) {
        let endpoint = SongEndPoint.TopTracks
        fetch(endpoint, parse: { json in
            guard let feed = json["feed"] as? [String: AnyObject], entry = feed["entry"] as? [[String: AnyObject]] else {
                return nil
            }
            return entry.flatMap() { songDict in entry
                return Song(JSON: songDict)
            }
            }, completion: completion)
    }
}