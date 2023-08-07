//
//  EmptyState.swift
//  Wani
//
//  Created by Vania on 07/08/23.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        VStack
        {
            Spacer()
            Image("OrderEmpty")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 40)
                .padding(.vertical, 20)
            Text("Your Order is Empty.")
                .font(.title)
                .fontWeight(.bold)
            Text("Place iPhone over food picture\nto add items.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(10)
            Spacer()
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}
