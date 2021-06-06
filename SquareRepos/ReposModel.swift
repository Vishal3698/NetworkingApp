//
//  DataModel.swift
//  SquareRepos
//
//  Created by Vishal Patel on 2021-06-04.
//

import SwiftUI

struct ReposModel: Codable, Identifiable {
    public var id: Int
    public var name: String
    public var full_name: String
    public var description: String?
}


//https://api.github.com/orgs/square/repos
//http://localhost:8080/crosscpp/toolbox/test
