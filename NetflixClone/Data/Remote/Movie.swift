//
//  Movie.swift
//  NetflixClone
//
//  Created by Raden Dimas on 16/05/22.
//

import Foundation


struct Movie: Identifiable {
    let id: String
    let name: String
    let thumbnailURL: URL
    
    let categories: [String]
}
