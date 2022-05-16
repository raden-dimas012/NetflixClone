//
//  SmallVerticalButton.swift
//  NetflixClone
//
//  Created by Raden Dimas on 16/05/22.
//

import SwiftUI

struct SmallVerticalButton: View {
    var text: String
    var isOnImage: String
    var isOffImage: String
    var isOn: Bool
    
//    var imageName: String {
//        if isOn {
//            isOnImage
//        } else {
//            isOffImage
//        }
//    }
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: isOn ? isOnImage : isOffImage)
                
                Text(text)
                    .font(.system(size: 14))
                    .bold()
            }
            .foregroundColor(.white)
        }
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        
        SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
            debugPrint("Tapped")
        }
        .preferredColorScheme(.dark)
        
    }
}
