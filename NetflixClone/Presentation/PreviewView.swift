//
//  PreviewView.swift
//  NetflixClone
//
//  Created by Raden Dimas on 18/05/22.
//

import SwiftUI

struct PreviewView: View {
    
    @ObservedObject var viewModel: PreviewViewModel
    
    var playVideo: Bool
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            TrailerPlayerView(
                videoURL: viewModel.movie.trailers.first?.videoURL,
                playVideo: .constant(playVideo))
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text(viewModel.movie.name)
                            .bold()
                            .font(.largeTitle)
                    })
                    
                    Spacer()
                    
                }
                .padding(.leading, 20)
                .padding(.top, 60)
                
                Spacer()
                
                
                HStack {
                    ForEach(0..<viewModel.movie.categories.count) { catIndex in
                        let category = viewModel.movie.categories[catIndex]
                        
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if catIndex != viewModel.movie.categories.count - 1 {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    SmallVerticalButton(
                        text: "My List",
                        isOnImage: "checkmark",
                        isOffImage: "plus",
                        isOn: true, color: viewModel.movie.accentColor) {
                        //
                    }
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("PLAY")
                                .fontWeight(.heavy)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 26)
                        .border(viewModel.movie.accentColor, width: 3)
                    })
                    
                    Spacer()
                    
                    SmallVerticalButton(
                        text: "Info",
                        isOnImage: "info.circle",
                        isOffImage: "info.circle",
                        isOn: true, color: viewModel.movie.accentColor) {
                        //
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 14)
            }
            .padding(.bottom, 48)
            .foregroundColor(viewModel.movie.accentColor)
        }
        .edgesIgnoringSafeArea(.vertical)
    }
    
    
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(viewModel: PreviewViewModel(movie: exampleMovie1), playVideo: true)
    }
}
