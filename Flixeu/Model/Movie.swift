//
//  Movie.swift
//  Flixeu
//
//  Created by Nicole Hipolito on 3/2/18.
//  Copyright © 2018 Nicole Hipolito. All rights reserved.
//

import Foundation
import UIKit

class Movie{
    var title: String
    var overview: String
    var posterUrl: URL?
    var backgdropUrl: URL?
    var releaseDate: String
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        // Set the rest of the properties
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterPathString = dictionary["poster_path"] as! String
        posterUrl = URL(string: baseURLString + posterPathString)!
        let backdropPathString = dictionary["backdrop_path"] as! String
        backgdropUrl = URL(string: baseURLString + backdropPathString)!
        overview = dictionary["overview"] as! String
        releaseDate = dictionary["release_date"] as! String
        
    }
}
