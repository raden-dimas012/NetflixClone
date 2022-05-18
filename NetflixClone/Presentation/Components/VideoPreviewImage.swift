//
//  VideoPreviewImage.swift
//  NetflixClone
//
//  Created by Raden Dimas on 17/05/22.
//

import SwiftUI
import Kingfisher

struct VideoPreviewImage: View {
    
    let imageURL: URL
    let videoURL: URL
    
    @State private var showingVideoPlayer = false
    
    var body: some View {
        ZStack {
            
            KFImage(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Button {
                showingVideoPlayer = true
            } label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            }
            .sheet(isPresented: $showingVideoPlayer, onDismiss: nil) {
                VideoView(videoURL: videoURL)
            }
        }
    }
}

struct VideoPreviewImage_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewImage(imageURL: exampleImageURL, videoURL: exampleVideoURL)
    }
}
