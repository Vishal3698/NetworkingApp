//
//  FetchData.swift
//  SquareRepos
//
//  Created by Vishal Patel on 2021-06-04.
//

import SwiftUI

class FetchData: ObservableObject {
    
    @Published var repos = [ReposModel]()
    
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
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
