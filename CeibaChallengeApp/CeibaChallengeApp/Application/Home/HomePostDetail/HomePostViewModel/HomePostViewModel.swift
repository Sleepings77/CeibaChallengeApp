//
//  HomePostViewModel.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 25/08/2022.
//

import Foundation

final class HomePostViewModel {
    
    private var networkingManager: NetworkingManager?
    
    init(networkingManager: NetworkingManager? = .shared) {
        self.networkingManager = NetworkingManager.shared
    }
    
    var refreshUserPost = { () -> () in }
    
    var userPosts: [UserPost] = [] { didSet { refreshUserPost() } }
    
    func fetchUserPosts(with id: Int) {
        networkingManager?.getPosts(completion: { [weak self] (result: Result<[UserPost], Error >) in
            switch result {
            case .success(let response):
                self?.userPosts = response
                break
            case .failure(_):
                break
            }
        },id: id)
    }
    
}
