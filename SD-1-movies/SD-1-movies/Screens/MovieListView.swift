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
    @Environment(\.modelContext) private var context
    
    var body: some View {
        List{
            ForEach(movies){ movie in // forEach added for delete capability
                NavigationLink(value: movie) {
                    HStack{
                        Text(movie.title)
                            .font(.title3).bold()
                        Spacer()
                        Text(movie.year.description)
                            .font(.caption)
                    } // hs
                } // navL
            } // forE
            .onDelete(perform: { indexSet in
                deleteMovie(indexSet: indexSet)
            })
        } // List
        .navigationDestination(for: Movie.self, destination: { movie in
            MovieDetailView(movie: movie)
        })
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
    } // some V
    
    private func deleteMovie(indexSet : IndexSet){
        indexSet.forEach { index in
            let movie = movies[index]
            context.delete(movie)
            do{
                try context.save()
            }
            catch{
                print(error.localizedDescription)
            }
        }
    } // func
    
}
