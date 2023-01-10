//
//  RateView.swift
//  EFREI-TP2-SwiftUI
//
//  Created by Amandine Cousin on 25/11/2022.
//

import SwiftUI

struct RateView: View {
    @ObservedObject var country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<country.rate, id: \.self) { i in
                    Image("fullHeart")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                ForEach(0..<5-country.rate, id: \.self) { i in
                    Image("emptyHeart")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
            HStack {
                Spacer()
                Stepper(value: $country.rate, in: 0...5) {
                    let _ = print("stepper updated : \($country.rate)")
                }
                    .frame(width: 100, height: 50)
                Spacer()
            }
        }
    }
}

struct RateView_Previews: PreviewProvider {
    static var previews: some View {
        RateView(country: Country(name: "Vietnam", pictureName: "vietnam", description: "Officially the Socialist Republic of Vietnam (Vietnamese: Cộng hòa Xã hội chủ nghĩa Việt Nam), is a country in Southeast Asia and the easternmost country on the Indochinese Peninsula. With an estimated 97.8 million inhabitants as of 2020, it is the 16th most populous country in the world. Vietnam shares its land borders with China to the north, and Laos and Cambodia to the west. It shares its maritime borders with Thailand through the Gulf of Thailand, and the Philippines, Indonesia and Malaysia through the South China Sea. Its capital city is Hanoi, and its most populous city is Ho Chi Minh City.", rate: 3))
    }
}
