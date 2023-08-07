//
//  CardView.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 07/08/23.
//

import SwiftUI

struct CardTap: View {
    var body: some View {
        ZStack{
            Image("Card")
                .resizable()
                .scaledToFit()
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Text("Add more by finding\nthis logo")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing)
                }.padding(.vertical, 10)
                Text("Total")
                    .font(.title3)
                    .foregroundColor(.white)
                Text("RP12.000")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }.padding(20)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardTap()
    }
}
