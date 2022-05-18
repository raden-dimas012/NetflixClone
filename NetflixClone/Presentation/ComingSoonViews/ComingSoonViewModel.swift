//
//  ComingSoonViewModel.swift
//  NetflixClone
//
//  Created by Raden Dimas on 18/05/22.
//

import Foundation

class ComingSoonViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
}
