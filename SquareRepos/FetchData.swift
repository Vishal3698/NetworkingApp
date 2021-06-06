//
//  FetchData.swift
//  SquareRepos
//
//  Created by Vishal Patel on 2021-06-04.
//

// ViewMddel

import SwiftUI

class FetchData: ObservableObject {
    @Published var repos = [ReposModel]()
    @Published var text: String?
    
    init() {
        let url = URL(string: "https://api.github.com/orgs/square/repos")!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let reposData = data {
                    let decodedData = try JSONDecoder().decode([ReposModel].self, from: reposData)
                    DispatchQueue.main.async {
                        self.repos = decodedData
                    }
                } else {
                    print("No data found from URL")
                    DispatchQueue.main.async {
                    self.text = "Error Reading Data"
                    }
                }
            } catch {
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                self.text = "Error loading Data"
                }
            }
        }.resume()
    }
}
