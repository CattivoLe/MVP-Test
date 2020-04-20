//
//  NetworkService.swift
//  MVP-Test
//
//  Created by Александр Омельчук on 20.04.2020.
//  Copyright © 2020 Александр Омельчук. All rights reserved.
//

import Foundation

//MARK: - Protocol
protocol NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void)
}

//MARK: - Class
class NetworkService: NetworkServiceProtocol {
    
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
         
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            do {
                let data = try JSONDecoder().decode([Comment].self, from: data!)
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
