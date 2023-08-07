//
//  Footer.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 07/08/23.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Total")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Spacer()
                Text("Rp42.000")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }.padding(.top, 10)
//            Text("Add more by tapping the top of your iPhone over food picture")
//                .font(.caption2)
//                .foregroundColor(Color("SecondaryDark"))
//                .padding(.vertical, 1)
            Button {
                
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: .infinity, height: 50)
                        .foregroundColor(Color("Primary"))
                        .cornerRadius(15)
                    Text("Place Order")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .background(Color("ColorBackground"))
//        .background(Color("Primary"))
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
