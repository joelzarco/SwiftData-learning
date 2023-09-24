//
//  Movie.swift
//  SD-1-movies
//
//  Created by sergio joel camacho zarco on 24/09/23.
//

import Foundation
import SwiftData

@Model
final class Movie{
    
    var title : String
    var year : Int
    
    init(title: String, year: Int) {
        self.title = title
        self.year = year
    }
    
}
