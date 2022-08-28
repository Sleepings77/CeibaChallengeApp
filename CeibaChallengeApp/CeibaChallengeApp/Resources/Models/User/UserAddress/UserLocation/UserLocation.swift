//
//  UserLocation.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 24/08/2022.
//

import Foundation

final class UserLocation: Codable {
    
    var lat : String?
    var lng : String?
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
    
}
