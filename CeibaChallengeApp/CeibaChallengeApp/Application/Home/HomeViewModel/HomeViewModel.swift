//
//  HomeViewModel.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 24/08/2022.
//

import Foundation

final class HomeViewModel {
    
    private var networkingManager: NetworkingManager?
    
    init(networkingManager: NetworkingManager? = .shared) {
        self.networkingManager = NetworkingManager.shared
    }
    
    var refreshUserData = { () -> () in }
        
    var users: [User] = [] { didSet { refreshUserData() } }
        
    func fetchUsers() {
        networkingManager?.getUsers(completion: { [weak self] (result: Result<[User], Error > ) in
            switch result {
            case .success(let response):
                self?.users = response
                self?.storeLocalData(with: response)
                break
            case .failure(_):
                break
            }
        })
    }
    
    private func storeLocalData(with users: [User]) {
        UserDefaults.standard.storeCodable(users, key: "StoredUsers")
    }
    
}
