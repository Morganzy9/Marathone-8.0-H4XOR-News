//
//  NetworkManager.swift
//  Marathone 8.0 H4XOR News
//
//  Created by Ислам Пулатов on 9/22/23.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                    print("HTTP Response Error: \(httpResponse.statusCode)")
                    return
                }
                
                if let safeData = data {
                    do {
                        let decoder = JSONDecoder()
                        let results = try decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch {
                        print("JSON Decoding Error: \(error)")
                    }
                }
            }
            
            task.resume()
        }
        
    }

    
}
