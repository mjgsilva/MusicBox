//
//  Playlist.swift
//  MusicBox
//
//  Created by Mário Silva on 23/01/15.
//  Copyright (c) 2015 Mário Silva. All rights reserved.
//

import Foundation
import UIKit

struct Playlist {
    
    var title: String
    var description: String
    var icon: UIImage?
    var largeIcon: UIImage?
    var artists: [String]
    var backgroundColor: UIColor?
    
    init(title: String, description: String, icon: String, largeIcon: String, artists: [String], color: [String:CGFloat]) {
        self.title = title
        self.description = description
        self.icon = UIImage(named: icon)
        self.largeIcon = UIImage(named: largeIcon)
        self.artists = artists
        self.backgroundColor = rgbColorFromDictionary(color)
    }
    
    func rgbColorFromDictionary(colorDictionary: [String:CGFloat]) -> UIColor {
        let red = colorDictionary["red"]!
        let green = colorDictionary["green"]!
        let blue = colorDictionary["blue"]!
        let alpha = colorDictionary["alpha"]!
        
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
}