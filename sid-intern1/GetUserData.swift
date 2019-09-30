//
//  GetUserData.swift
//  sid-intern
//
//  Created by externalOS on 07/09/19.
//  Copyright © 2019 siddhartha. All rights reserved.
//

import Foundation
import SwiftUI


class  NetworkData:ObservableObject{
    
    @Published var user: UserDatas = [UserData]()
    
    init(email:String){
        // url of the website
        let url = URL(string: "http://surya-interview.appspot.com/list")!
        // url request costamise
        var urlget = URLRequest(url: url)
        // using email from ContentView SwiftUI
        let emailing = Email(emailId: email)
        // encoding email to json using struct type Email
        let sendingEmail = try! JSONEncoder().encode(emailing)
        //testing to check how json looks
    //    if let jsonString = String(data: emailing, encoding: .utf8) {
    //        print(jsonString)
    //    }
        print("\("should change to email") and \(sendingEmail)")
        // request type
        urlget.httpMethod = "POST"
        // url POST content type
        urlget.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //data to posted with http request (In this example the Email of the user)
        urlget.httpBody = sendingEmail
        
        
          let value = URLSession.shared.dataTask(with: urlget){ (data,response,error) in
                   guard let data = data else {return}
                  
                  debugPrint(data)
                  DispatchQueue.main.async {
                      let result = try! JSONDecoder().decode(Users.self, from: data)
                    self.user = result.items
                      print("\(result.items[0].emailId)")
                  }
        

    // THIS MATHOD IS USED TO POST HTTP REQUEST WITH DATA
    //    let value = URLSession.shared.uploadTask(with: urlget ,from: sendingEmail){ (data,response,error) in
    //             guard let data = data else {return}
    //
    //            print(data)
    //            DispatchQueue.main.async {
    //                let result = try! JSONDecoder().decode(Users.self, from: data)
    //                print("\(result.items[0].emailId)")
    //            }
                    
                 
        }
        
             value.resume()
        
    }

}


//func getUserDataRequest(email:String){
//    // url of the website
//    let url = URL(string: "http://surya-interview.appspot.com/list")!
//    // url request costamise
//    var urlget = URLRequest(url: url)
//    // using email from ContentView SwiftUI
//    let emailing = Email(emailId: email)
//    // encoding email to json using struct type Email
//    let sendingEmail = try! JSONEncoder().encode(emailing)
//    //testing to check how json looks
////    if let jsonString = String(data: emailing, encoding: .utf8) {
////        print(jsonString)
////    }
//    print("\(email) and \(sendingEmail)")
//    // request type
//    urlget.httpMethod = "POST"
//    // url POST content type
//    urlget.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    //data to posted with http request (In this example the Email of the user)
//    urlget.httpBody = sendingEmail
//    
//    
//      let value = URLSession.shared.dataTask(with: urlget){ (data,response,error) in
//               guard let data = data else {return}
//              
//              print(data)
//              DispatchQueue.main.async {
//                  let result = try! JSONDecoder().decode(Users.self, from: data)
//                  print("\(result.items[0].emailId)")
//              }
//    
//
//// THIS MATHOD IS USED TO POST HTTP REQUEST WITH DATA
////    let value = URLSession.shared.uploadTask(with: urlget ,from: sendingEmail){ (data,response,error) in
////             guard let data = data else {return}
////
////            print(data)
////            DispatchQueue.main.async {
////                let result = try! JSONDecoder().decode(Users.self, from: data)
////                print("\(result.items[0].emailId)")
////            }
//                
//             
//    }
//    
//         value.resume()
//    
//}
//

// how to implement combine framework to upload
