//
//  UserData.swift
//  sid-intern
//
//  Created by externalOS on 07/09/19.
//  Copyright © 2019 siddhartha. All rights reserved.
//

import Foundation

struct Email:Codable {
    let emailId:String
}

struct Users: Codable {
//    var id: UUID
    var items:[UserData]
}

struct UserData: Codable {
    
//    var id: UUID
    var emailId:String
    var lastName:String
    var imageUrl:String
    var firstName:String
    
}

typealias UserDatas = [UserData]

