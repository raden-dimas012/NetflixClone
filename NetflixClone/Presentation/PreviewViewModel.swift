//
//  PreviewViewModel.swift
//  NetflixClone
//
//  Created by Raden Dimas on 18/05/22.
//

import Foundation

class PreviewViewModel: ObservableObject {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
}
