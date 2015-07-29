//
//  dataModel.swift
//  Netflicks
//
//  Created by Matthew Barth on 7/28/15.
//  Copyright (c) 2015 Matthew Barth. All rights reserved.
//

import Foundation
import UIKit


enum categoryType {
    case history
    case modern
    case funny
}

class show {
    var type: categoryType!
    var featureFilm: Bool!
    var url: NSURL? = nil
    var imagePath: UIImage!
    var title: String!
    var comments: String!
    var tubeUrl: NSURL? = nil
    
    init (type: categoryType, featureFilm: Bool, url: String, tubeUrl: String, imagePath: UIImage, title: String, comments: String) {
        self.type = type
        self.url = NSURL(string: url)
        self.tubeUrl = NSURL(string: tubeUrl)
        self.imagePath = imagePath
        self.title = title
        self.comments = comments
    }
}