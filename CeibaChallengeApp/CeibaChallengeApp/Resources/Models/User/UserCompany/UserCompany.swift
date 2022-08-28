//
//  UserCompany.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 24/08/2022.
//

import Foundation

final class UserCompany: Codable {
    
    var name        : String?
    var catchPhrase : String?
    var bs          : String?
    
    enum CodingKeys: String, CodingKey {
        case name        = "name"
        case catchPhrase = "catchPhrase"
        case bs          = "bs"
    }
    
}
