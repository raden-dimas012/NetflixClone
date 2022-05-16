//
//  GlobalHelper.swift
//  NetflixClone
//
//  Created by Raden Dimas on 16/05/22.
//

import Foundation
import SwiftUI


let exampleMovie1 = Movie(id: UUID().uuidString, name: "Dark", thumbnailURL: URL(string: "https://i.pinimg.com/736x/9c/f2/22/9cf222c76b02487c040b2ed7e67772e6.jpg")!, categories: ["Animation","Action","Adventure"])
let exampleMovie2 = Movie(id: UUID().uuidString, name: "Dark", thumbnailURL: URL(string: "https://i.pinimg.com/736x/9c/f2/22/9cf222c76b02487c040b2ed7e67772e6.jpg")!, categories: ["Animation","Action","Adventure"])
let exampleMovie3 = Movie(id: UUID().uuidString, name: "Dark", thumbnailURL: URL(string: "https://i.pinimg.com/736x/9c/f2/22/9cf222c76b02487c040b2ed7e67772e6.jpg")!, categories: ["Animation","Action","Adventure"])
let exampleMovie4 = Movie(id: UUID().uuidString, name: "Dark", thumbnailURL: URL(string: "https://i.pinimg.com/736x/9c/f2/22/9cf222c76b02487c040b2ed7e67772e6.jpg")!, categories: ["Animation","Action","Adventure"])

let exampleMovies: [Movie] = [exampleMovie1,exampleMovie2,exampleMovie3,exampleMovie4]



extension LinearGradient {
    static let blackOpacityGradient =  LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0.0),Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom)
}
