//
//  AddMovieView.swift
//  SD-1-movies
//
//  Created by sergio joel camacho zarco on 24/09/23.
//

import SwiftUI
import SwiftData

struct AddMovieView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var title : String = ""
    @State private var year : Int?
    
    private var isFormValid : Bool{
        !title.isEmptyorWhiteSpace && year != nil
    }
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Title", text: $title)
                TextField("Year", value: $year, format: .number)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Add movie")
        }
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button("Close"){
                     dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save"){
                    guard let year = year else { return }
                    let movie = Movie(title: title, year: year)
                    // here's where the magic happens
                    context.insert(movie)
                    do{
                        try context.save()
                        dismiss()
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                }
                .disabled(!isFormValid)
            }
        }
    }
}

//#Preview {
//    AddMovieView()
//}
