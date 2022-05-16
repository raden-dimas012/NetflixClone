//
//  WhiteButton.swift
//  NetflixClone
//
//  Created by Raden Dimas on 16/05/22.
//

import SwiftUI

struct WhiteButton: View {
    
    var text: String
    var imageName: String
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                
                Spacer()
                
                Image(systemName: imageName)
                    .font(.headline)
                
                Text(text)
                    .font(.system(size: 16))
                    .bold()
                
                Spacer()
            }
            .padding(.vertical,10)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(5.0)
        }

    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        
        WhiteButton(text: "Play", imageName: "play.fill") {
            
        }
        .preferredColorScheme(.dark)
        
    }
}
