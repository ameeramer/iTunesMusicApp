//
//  ArtistClient.swift
//  iTunesMusicApp
//
//  Created by Ameer Amer on 26/08/2016.
//  Copyright © 2016 Ameer Amer. All rights reserved.
//

import Foundation

enum ArtistEndPoint: Endpoint {
    case ArtistById(id: String)
    
    var baseURL: String {
        return "https://itunes.apple.com"
    }
    
    var path: String {
        switch self {
        case .ArtistById: return "/lookup"
        }
    }
    var parameters: [String: AnyObject] {
        switch self {
        case .ArtistById(let id):
            return ["id": id, "entity" : "album"]
        }
    }
}

final class ArtistClient: APIClient {
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
    
    func fetchAlbums(id: String, completion: APIResult<[Album]> -> Void) {
        let endpoint = ArtistEndPoint.ArtistById(id: id)
        fetch(endpoint, parse: { json in
            guard var results = json["results"] as? [[String: AnyObject]] else {
                return nil
            }
            results.removeFirst()
            return results.flatMap() { albumDict in
                return Album(JSON: albumDict)
            }
            }, completion: completion)
    }
}
