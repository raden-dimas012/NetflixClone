//
//  HomeView.swift
//  NetflixClone
//
//  Created by Raden Dimas on 16/05/22.
//

import SwiftUI


enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String {
    case AllGenres
    case Action
    case Comedy
    case Horror
    case Thriller
}

struct HomeView: View {
    
    var viewModel = HomeViewModel()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    @Binding var showPreviewFullscreen: Bool
    @Binding var previewStartingIndex: Int
    
    
    var body: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            // main vstack
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre, showGenreSelection: $showGenreSelection, showTopRowSelection: $showTopRowSelection)
                    
                    TopMoviePreview(movie: exampleMovie5)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    MoviePreviewRow(
                        movies: exampleMovies,
                        showPreviewFullscreen: $showPreviewFullscreen,
                        previewStartingIndex: $previewStartingIndex
                    )
                    
                    HomeStack(
                        viewModel: viewModel,
                        topRowSelection: topRowSelection,
                        selectedGenre: homeGenre,
                        movieDetailToShow: $movieDetailToShow,
                        showPreviewFullscreen: $showPreviewFullscreen,
                        previewStartingIndex: $previewStartingIndex
                    )
                }
            }
            
            if movieDetailToShow != nil { // check for showing detail view view tap on list or not
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(
                        Animation.easeIn(duration: 2.0),
                        value: 0) // Please test this animation
                    .transition(.opacity)
            }
            
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        
                        Spacer()
                        
                        ForEach(HomeTopRow.allCases, id: \.self) { topRow in
                            
                            Button(action: {
                                topRowSelection = topRow
                                showTopRowSelection = false
                            }, label: {
                                if topRow == topRowSelection {
                                    Text("\(topRow.rawValue)")
                                        .bold()
                                } else {
                                    Text("\(topRow.rawValue)")
                                        .foregroundColor(.gray)
                                }
                            })
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showTopRowSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        
                        Spacer()
                        
                        ScrollView {
                            
                            ForEach(viewModel.allGenre, id: \.self) { genre in
                                
                                Button(action: {
                                    homeGenre = genre
                                    showGenreSelection = false
                                }, label: {
                                    if genre == homeGenre {
                                        Text("\(genre.rawValue)")
                                            .bold()
                                    } else {
                                        Text("\(genre.rawValue)")
                                            .foregroundColor(.gray)
                                    }
                                })
                                .padding(.bottom, 40)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showGenreSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            showPreviewFullscreen: .constant(false),
            previewStartingIndex: .constant(0))
    }
}

struct TopRowButtons: View {
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(PlainButtonStyle())
                
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                .buttonStyle(PlainButtonStyle())
                
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .myList
                }, label: {
                    Text("My List")
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
            
        case .myList, .tvShows, .movies:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(PlainButtonStyle())
                
                
                HStack(spacing: 20) {
                    Button(action: {
                        showTopRowSelection = true // setup for sh
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    .buttonStyle(PlainButtonStyle()) // For When Clicked Change to this
                    
                    
                    Button(action: {
                        showGenreSelection = true // setup for showing
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 12))
                            
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        }
        
    }
}


