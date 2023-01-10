//
//  ViewModel.swift
//  EFREI-TP2-SwiftUI
//
//  Created by Amandine Cousin on 10/01/2022.
//

import Foundation

struct ViewModel {
    var countriesArray: [Country] = ModelData().load("countriesData.json")
}


