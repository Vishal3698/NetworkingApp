//
//  ContentView.swift
//  SquareRepos
//
//  Created by Vishal Patel on 2021-06-04.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @ObservedObject var fetchData = FetchData()

    var body: some View {
        NavigationView{
            List(fetchData.repos) { repo in
                VStack(alignment: .leading) {
                    HStack{
                        Text("Name:").bold()
                        Text(repo.name)
                        Spacer()
                        let id = String(repo.id)
                        Text("ID: " + id).foregroundColor(.blue)
                    }
                    if let desc = repo.description {
                            Text("\n" + "Description: ").bold()
                            Text(desc)
                    
                    } else {
                        Text("No description available")
                    }
                }
            }
           .navigationTitle("Square Repositories")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
