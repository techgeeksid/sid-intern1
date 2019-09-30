//
//  NetworkingManager.swift
//  sid-intern
//
//  Created by externalOS on 17/09/19.
//  Copyright © 2019 siddhartha. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class NetworkingManager: ObservableObject {
    let didChange = PassthroughSubject<NetworkingManager, Never>()
    
    func fetchUserData() -> AnyPublisher<Users,Error> {
        // url of the website
        let url = URL(string: "http://surya-interview.appspot.com/list")!
        // url request costamise
        var urlget = URLRequest(url: url)
        // using email from ContentView SwiftUI
        let emailing = Email(emailId: "test@example.com")
        // encoding email to json using struct type Email
        let sendingEmail = try! JSONEncoder().encode(emailing)
        //testing
        print("\(sendingEmail)")
        // request type
        urlget.httpMethod = "POST"
        // url POST content type
        urlget.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //data to posted with http request (In this example the Email of the user)
        urlget.httpBody = sendingEmail
        
        return URLSession.shared.dataTaskPublisher(for: urlget)
            .map{$0.data}
            .decode(type: Users.self, decoder: JSONDecoder())
            .map{$0.self}
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    
}

