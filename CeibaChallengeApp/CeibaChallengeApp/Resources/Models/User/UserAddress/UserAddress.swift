//
//  UserAddress.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 24/08/2022.
//

import Foundation

final class UserAddress: Codable {
    
    var street  : String?
    var suite   : String?
    var city    : String?
    var zipcode : String?
    var geo     : UserLocation?
    
    enum CodingKeys: String, CodingKey {
        case street  = "street"
        case suite   = "suite"
        case city    = "city"
        case zipcode = "zipcode"
        case geo     = "geo"
    }
    
}
