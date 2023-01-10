

import SwiftUI

struct DetailView: View {
    @ObservedObject var country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var body: some View {
        VStack {
            VStack {
                Image("Activity")
                    .resizable()
                    .frame(height: 200, alignment: .top)
                    .aspectRatio(1, contentMode: .fill)
                    .border(.black, width: 2)
                    .cornerRadius(5)
                    .padding(.bottom, 30)
                HStack{
                    VStack{
                        Text("Breakfast").fontWeight(.bold)
                        Text("Activity: Meal")
                    }.padding(.leading,80)
                    Spacer()
                    VStack{
                        Text("Janv. 09").background(Color.red.edgesIgnoringSafeArea(.all))
                        Text("9:30")
                        Text("10:30")
                    }.background(Color.gray.edgesIgnoringSafeArea(.all)).cornerRadius(10)
                }.padding(10).background(.cyan).cornerRadius(10)
                
                Divider()
                
                HStack{
                    Image(systemName: "map")
                    Spacer()
                    Text("President's dining hall").fontWeight(.bold).lineLimit(1)
                }.padding(20).background(.green).cornerRadius(20)
                Divider()
                HStack{
                    Image(systemName: "person.circle")
                    Spacer()
                    Text("Belinda Chen, Deepa Vartak").fontWeight(.bold).lineLimit(1)
                }.padding(20).background(.green).cornerRadius(20)

            }.padding(2).padding(.bottom,150)
            
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(country: Country(name: "Vietnam", pictureName: "vietnam", description: "Officially the Socialist Republic of Vietnam (Vietnamese: Cộng hòa Xã hội chủ nghĩa Việt Nam), is a country in Southeast Asia and the easternmost country on the Indochinese Peninsula. With an estimated 97.8 million inhabitants as of 2020, it is the 16th most populous country in the world. Vietnam shares its land borders with China to the north, and Laos and Cambodia to the west. It shares its maritime borders with Thailand through the Gulf of Thailand, and the Philippines, Indonesia and Malaysia through the South China Sea. Its capital city is Hanoi, and its most populous city is Ho Chi Minh City.", rate: 3))
    }
}
