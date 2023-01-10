//
//  Country.swift
//  EFREI-TP2
//
//  Created by Amandine Cousin on 18/02/2021.
//

import Foundation
import SwiftUI

class Country: Decodable, ObservableObject {
    let name: String
    let pictureName: String
    let description: String
    @Published var rate: Int
    
    var image: Image {
        Image(pictureName)
    }
    
    init(name: String, pictureName: String, description: String, rate: Int) {
        self.name = name
        self.pictureName = pictureName
        self.description = description
        self.rate = rate
    }
}

// Make the Published conformed to Decodable protocol
extension Published: Decodable where Value:Decodable {
    public init(from decoder: Decoder) throws {
        let decoded = try Value(from: decoder)
        self = Published(initialValue: decoded)
    }
}
