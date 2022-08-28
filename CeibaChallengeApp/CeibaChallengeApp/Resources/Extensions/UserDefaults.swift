//
//  UserDefaults.swift
//  CeibaChallengeApp
//
//  Created by MatiasCastillo on 27/08/2022.
//

import Foundation

extension UserDefaults {
    func storeCodable<T: Codable>(_ object: [T], key: String) {
        do {
            let data = try JSONEncoder().encode(object)
            UserDefaults.standard.set(data, forKey: key)
        } catch let error {
            print("Error encoding: \(error)")
        }
    }
    
    func retrieveCodable<T: Codable>(for key: String) -> [T]? {
        do {
            guard let data = UserDefaults.standard.data(forKey: key) else {
                return nil
            }
            return try JSONDecoder().decode([T].self, from: data)
        } catch let error {
            print("Error decoding: \(error)")
            return nil
        }
    }
}
