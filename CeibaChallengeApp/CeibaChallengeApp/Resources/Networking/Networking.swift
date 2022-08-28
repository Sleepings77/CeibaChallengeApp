//
//  Networking.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 24/08/2022.
//

import Alamofire

final class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    private var baseURL: String {
        return "https://jsonplaceholder.typicode.com"
    }
            
    enum NetworkingError : Error {
        case parsingError
    }
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let request = AF.request (
            "\(baseURL)/users",
            method: HTTPMethod.get
            )
        
        request.responseData { (response: AFDataResponse<Data>) in
            guard let data = response.data else {
                completion (.failure(NetworkingError.parsingError))
                return
            }
            
            let decoder = JSONDecoder()
            let response = try? decoder.decode([User].self, from: data)
            
            completion(.success(response ?? []))
        }
    }
    
    private func checkRequestID(id: Int? = nil) -> DataRequest {

        guard let id = id else {
            let request = AF.request (
                "\(baseURL)/posts",
                method: HTTPMethod.get)
            return request
        }
        
        let request = AF.request (
            "\(baseURL)/posts?userId=\(id)",
            method: HTTPMethod.get)
        return request
    }
    
    func getPosts(completion: @escaping (Result<[UserPost], Error>) -> Void, id: Int? = nil) {
        
        let request = checkRequestID(id: id)
        
        request.responseData { (response: AFDataResponse<Data>) in
            guard let data = response.data else {
                completion (.failure(NetworkingError.parsingError))
                return
            }
            
            let decoder = JSONDecoder()
            let response = try? decoder.decode([UserPost].self, from: data)
            
            completion(.success(response ?? []))
        }
    }
    
}
