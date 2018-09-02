//
//  AniListRepository.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/27/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation

class AniListRepository {
    
    /// Perform a GET request to AniList, handling errors and response.
    ///sdf
    /// - Parameters:
    ///   - endpoint: Use to specify the API endpoint.
    ///   - completion: Closure that returns `data` for the network request.
    ///   - data: Data information retrieve from the API.
    func execute(query: Parameters, completion: @escaping (_ data: AniList?) -> Void) {
        
        guard let url = URL(string: apiURL) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.setDefaultHeaders()
        urlRequest.httpMethod = "POST"
        let bodyData = try? JSONSerialization.data(withJSONObject: query, options: .prettyPrinted)
        urlRequest.httpBody = bodyData
        
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            do {
                let AniListData = try JSONDecoder().decode(AniList.self, from: data)
                completion(AniListData)
            } catch {
                completion(nil)
            }
        }.resume()
        return
    }
    
}

fileprivate extension URLRequest {
    
    /// Define the operating parameters on an existing WizeQ request.
    mutating func setDefaultHeaders() {
        self.setValue("application/json", forHTTPHeaderField: "Accept")
        self.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}
