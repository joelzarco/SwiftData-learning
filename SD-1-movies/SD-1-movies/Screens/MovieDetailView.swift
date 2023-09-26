//
//  MovieDetailView.swift
//  SD-1-movies
//
//  Created by sergio joel camacho zarco on 26/09/23.
//

import SwiftUI
import SwiftData

struct MovieDetailView: View {
    
    let movie : Movie
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title : String = ""
    @State private var year : Int?
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            
            TextField("Year", value: $year, format: .number)
                .keyboardType(.numberPad)
            Button("Update"){
                guard let year = year else { return }
                movie.title = title
                movie.year = year
                do{
                    try context.save()
                    dismiss()
                }
                catch{
                    print(error.localizedDescription)
                }
            }
            .buttonStyle(.borderless)
        }
        .onAppear{
            title = movie.title
            year = movie.year
        }
    }
}

//#Preview {
//    MovieDetailView()
//}
