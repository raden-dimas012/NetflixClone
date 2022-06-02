//
//  TrailerPlayerView.swift
//  NetflixClone
//
//  Created by Raden Dimas on 18/05/22.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    
    var videoURL: URL?
    
    @Binding var playVideo: Bool
    
    var body: some View {
        if videoURL != nil {
            VideoPlayer(url: videoURL!, play: $playVideo)
        } else {
            Text("Could Not Load Video")
        }
    }
}

struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(videoURL: nil, playVideo: .constant(true))
    }
}
