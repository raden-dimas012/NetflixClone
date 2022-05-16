//
//  TopMoviePreview.swift
//  NetflixClone
//
//  Created by Raden Dimas on 16/05/22.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    
    var movie: Movie
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                Spacer()
                
                HStack {
                    ForEach(movie.categories,id: \.self) { category in
                        
                        HStack {
                            Text(category)
                            
                            if !isCategoryLast(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                Text("wkwkkwkwkw")
            }
            
            
        }
        .foregroundColor(.white)
    }
    
    private func isCategoryLast(_ category: String) -> Bool {
        let categoryCount = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: category) {
            if index + 1 != categoryCount {
                return false
            }
        }
        
        return true
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie1)
    }
}
