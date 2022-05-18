//
//  VideoView.swift
//  NetflixClone
//
//  Created by Raden Dimas on 17/05/22.
//

import SwiftUI
import AVKit

struct VideoView: View {
    
    var videoURL: URL
    
    private var player: AVPlayer {
        AVPlayer(url: videoURL)
    }
    
    var body: some View {
        VideoPlayer(player: player)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(videoURL: exampleVideoURL)
    }
}
