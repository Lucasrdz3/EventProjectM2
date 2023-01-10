//
//  ContentView.swift
//  EventProjectM2
//
//  Created by user232282 on 12/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel: ViewModel
    var title : String
    var body: some View {
        NavigationView {
            List(viewModel.countriesArray, id: \.name) { country in
                NavigationLink(destination: DetailView(country: country)) {
                    DetailRow(country: country)
                }.padding(3)            }
            .navigationTitle(title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel(),title: "Home")
    }
}
