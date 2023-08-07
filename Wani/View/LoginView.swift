//
//  LoginView.swift
//  Wani
//
//  Created by Reyner Fernaldi on 07/08/23.
//

import SwiftUI

struct LoginView: View {
    @State var username:String = ""
    @State var password:String = ""
    @State var state:Bool = false
    @State var p:Bool = false
    
    var body: some View {
        NavigationStack{

            VStack(alignment: .leading){
                Spacer()
                Text("Username")
                TextField("Username", text: $username)
                    .autocapitalization(.none)
                Text("Password")
                SecureField("Enter a password", text: $password)
                    .autocapitalization(.none)
                Spacer()
                Button {
                    if(username == "admin" && password == "admin"){
                        state = true
                    }
                    else{
                        p = true
                    }
                    
                } label: {
                    VStack{
                        if(p == true){
                            Text("pergi sana!")
                                .foregroundColor(.red)
                        }
                        Text("Login")
                            .padding()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color("Primary"))
                    }
                    
                }
                Spacer()
            }
            .navigationTitle("Login")
            .padding()
            NavigationLink(destination: KitchenView().navigationBarBackButtonHidden(), isActive: $state) {
                EmptyView()
            }
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: "admin")
    }
}
