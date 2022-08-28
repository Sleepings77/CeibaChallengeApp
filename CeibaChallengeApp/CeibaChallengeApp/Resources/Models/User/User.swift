//
//  User.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 24/08/2022.
//

import Foundation

final class User: Codable {
    
    var id       : Int?
    var name     : String?
    var username : String?
    var email    : String?
    var address  : UserAddress?
    var phone    : String?
    var website  : String?
    var company  : UserCompany?
    
    enum CodingKeys: String, CodingKey {
        case id       = "id"
        case name     = "name"
        case username = "username"
        case email    = "email"
        case address  = "address"
        case phone    = "phone"
        case website  = "website"
        case company  = "company"
    }
    
}
