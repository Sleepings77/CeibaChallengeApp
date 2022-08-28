//
//  UserPosts.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 24/08/2022.
//

import Foundation

final class UserPost: Codable {
    
    var userId : Int?
    var id     : Int?
    var title  : String?
    var body   : String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id     = "id"
        case title  = "title"
        case body   = "body"
    }
    
}
