//
//  ContentView.swift
//  sid-intern1
//
//  Created by externalOS on 29/09/19.
//  Copyright © 2019 siddhartha. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var email:String = ""
    @State var Show:Bool = false
    @State var IsEmailEmpty:Bool = false
    var body: some View {
        NavigationView{
            VStack{
                
                HStack{
                    Image(systemName: "at")
                        .padding(.leading)
                        .foregroundColor(.blue)
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .animation(.default)
                    }
                
                Button(action: {
                    if self.email.isEmpty{
                        self.IsEmailEmpty = true
                    }else{
                        self.Show.toggle()
                    }
                
                }){
                    Text("submit")
                        .foregroundColor(Color("ToggleWhite"))
                        .frame(width: 80.0, height: 45.0)
                        .background(Color("ToggleBlack"))
                        .padding()
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    
                }
                .alert(isPresented: self.$IsEmailEmpty){
                Alert(title: Text("Email not found"), message: Text("Please enter your email"), dismissButton: .default(Text("Dismiss")))
                }
//                NavigationLink(destination: DetailView(email: self.email, model: NetworkData(email: self.email))){
//                    Text("submit")
//                        .foregroundColor(Color("ToggleWhite"))
//                        .frame(width: 80.0, height: 45.0)
//                        .background(Color("ToggleBlack"))
//                        .padding()
//                        .cornerRadius(10)
//                        .shadow(radius: 10)
//                    }
            }
                
        }
        .sheet(isPresented: $Show, content: {DetailView(email: self.email, model: NetworkData(email: self.email))})
    }
}

struct DetailView: View {
    var email:String
    @ObservedObject var model: NetworkData
    var body: some View{
        List (self.model.user , id: \.emailId){
            UserDatas in
            HStack{
                UrlImage(url: "\(UserDatas.imageUrl)")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100.0, height: 100.0)
                    .clipShape(Circle())
                    .animation(.default)
                VStack(alignment: .leading){
                    Text("first name:\(UserDatas.firstName)")
                    Text("last name:\(UserDatas.lastName)")
                    Text("email:\(UserDatas.emailId)")
                }
            }
                
        }
        
     }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
