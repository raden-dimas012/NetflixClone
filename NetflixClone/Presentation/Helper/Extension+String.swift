//
//  Extension+String.swift
//  NetflixClone
//
//  Created by Raden Dimas on 18/05/22.
//

import Foundation
import SwiftUI


extension String {
   func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
