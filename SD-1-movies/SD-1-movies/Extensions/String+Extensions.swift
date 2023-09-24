//
//  String+Extensions.swift
//  SD-1-movies
//
//  Created by sergio joel camacho zarco on 24/09/23.
//

import Foundation

extension String{
    
    var isEmptyorWhiteSpace : Bool{
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
