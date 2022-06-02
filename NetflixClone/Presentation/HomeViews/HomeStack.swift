//
//  HomeStack.swift
//  NetflixClone
//
//  Created by Raden Dimas on 18/05/22.
//

import SwiftUI

struct HomeStack: View {
    var viewModel: HomeViewModel
    
    var topRowSelection: HomeTopRow
    var selectedGenre: HomeGenre
    
    @Binding var movieDetailToShow: Movie?
    
    @Binding var showPreviewFullscreen: Bool
    @Binding var previewStartingIndex: Int
    
    
    var body: some View {
        ForEach(viewModel.allCategories, id: \.self) { category in
            VStack {
                HStack {
                    Text(category)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(viewModel.getMovie(forCat: category, andHomeRow: topRowSelection, andGenre: selectedGenre)) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 135, height: 200)
                                .onTapGesture(perform: {
                                    movieDetailToShow = movie
                                }) // This for detail view
                        }
                    }
                }
            }
            .padding(.leading, 6)
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            HomeStack(
                viewModel: HomeViewModel(),
                topRowSelection: .home,
                selectedGenre: .AllGenres,
                movieDetailToShow: .constant(nil),
                showPreviewFullscreen: .constant(false),
                previewStartingIndex: .constant(0)
            )
                .preferredColorScheme(.dark)
        }
        .foregroundColor(.white)
        
    }
}
