//
//  Trailer.swift
//  NetflixClone
//
//  Created by Raden Dimas on 17/05/22.
//

import Foundation

struct Trailer: Identifiable,Hashable {
    
    let id: String = UUID().uuidString
    let name: String
    let videoURL: URL
    let thumbnailImageURL: URL
    
}
