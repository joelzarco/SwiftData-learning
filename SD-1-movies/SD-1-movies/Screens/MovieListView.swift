//
//  MovieListView.swift
//  SD-1-movies
//
//  Created by sergio joel camacho zarco on 25/09/23.
//

import Foundation
import SwiftUI
import SwiftData

struct MovieListView : View {
    // queries can be sorted from macro @Query
    @Query(sort: \Movie.title, order: .reverse) private var movies : [Movie]
    @State private var isAddMoviePresented : Bool = false
    
    var body: some View {
        List(movies){ movie in
            HStack{
                Text(movie.title)
                    .font(.title2).bold()
                Spacer()
                Text("\(movie.year) AD")
                    .font(.caption)
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Movie"){
                    isAddMoviePresented = true
                }
            }
        })
        .sheet(isPresented: $isAddMoviePresented, content: {
            NavigationStack{
                AddMovieView()
            }
        })
    }
}
