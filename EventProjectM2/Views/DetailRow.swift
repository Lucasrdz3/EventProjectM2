//
//  DetailRow.swift
//  EFREI-TP2-SwiftUI
//
//  Created by Amandine Cousin on 10/01/2022.
//

import SwiftUI

struct DetailRow: View {
    var country: Country
    
    var body: some View {
        HStack {
            VStack{
                Text("Janv. 09").background(Color.red.edgesIgnoringSafeArea(.all))
                Text("9:30")
                Text("10:30")
            }.background(.gray).cornerRadius(10)
            
            Spacer()

            VStack{
                Text("Breakfast").fontWeight(.bold)
                Text("President's dining hall").lineLimit(1)
                Text("Belinda Chen, Deepa Vartak").lineLimit(1)
            }
            Spacer()
            Text("Meal").padding(5).background(Color.yellow).cornerRadius(10)

            Spacer()
            
            
        }
    }
}

struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(country: Country(name: "Vietnam", pictureName: "vietnam", description: "Officially the Socialist Republic of Vietnam (Vietnamese: Cộng hòa Xã hội chủ nghĩa Việt Nam), is a country in Southeast Asia and the easternmost country on the Indochinese Peninsula. With an estimated 97.8 million inhabitants as of 2020, it is the 16th most populous country in the world. Vietnam shares its land borders with China to the north, and Laos and Cambodia to the west. It shares its maritime borders with Thailand through the Gulf of Thailand, and the Philippines, Indonesia and Malaysia through the South China Sea. Its capital city is Hanoi, and its most populous city is Ho Chi Minh City.", rate: 3))
    }
}

