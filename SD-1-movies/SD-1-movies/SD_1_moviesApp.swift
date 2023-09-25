//
//  SD_1_moviesApp.swift
//  SD-1-movies
//
//  Created by sergio joel camacho zarco on 24/09/23.
//

import SwiftUI

@main
struct SD_1_moviesApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            NavigationStack{
//                AddMovieView()
                MovieListView()
            }
        }
        .modelContainer(for: [Movie.self])
    }
}
