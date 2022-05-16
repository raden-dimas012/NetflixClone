//
//  HomeViewModel.swift
//  NetflixClone
//
//  Created by Raden Dimas on 16/05/22.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    // String -> Category
    @Published var movies: [String: [Movie]] = [:]
    public var allCategories: [String] {
        movies.keys.map( { String($0)} )
    }
    
    public func getMovie(forCategory category: String) -> [Movie] {
        return movies[category]  ?? []
    }
    
    init() {
        setupMovies()
    }
    
    private func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Standard Category"] = exampleMovies
        movies["Now Release"] = exampleMovies
        movies["Recommended For You!"] = exampleMovies
        movies["Action"] = exampleMovies
       
    }
    
}
