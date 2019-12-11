//
//  GitHubCrawlerLibrary.swift
//  GitHubCrawlerLibrary
//
//  Created by Tejas, Dhanuka on 2019/12/11.
//  Copyright © 2019 Tejas, Dhanuka. All rights reserved.
//

import Foundation

public final class GitHubCrawlerLibrary {
    let name = "GitHubCrawlerLibrary"
    
    let model: RepositoriesModel = RepositoriesModel()
    
    public func fetchGitRepos(for platform: String, dept: String) {
        guard let url = URL(string: String(format: "https://api.github.com/search/repositories?q=%@+org:%@", platform, dept) ) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let data = data else {
                print("Empty data")
                return
            }
            do {
                let repositoriesList = try JSONDecoder().decode(GitRepositoriesList.self, from: data)
                self.model.loadRepositories(repositories: repositoriesList.repositories ?? [GitRepository]())
            } catch let parsingError {
                print("Error", parsingError)
            }
        }.resume()
    }
}

//MARK: - Structures

public struct GitRepositoriesList: Decodable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let repositories: [GitRepository]?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case repositories = "items"
    }
}

public struct GitRepository: Decodable {
    var name: String?
    var isPrivate: Bool?
    var description: String?
    var language: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case isPrivate = "private"
        case description
        case language
    }
}

// MARK: - Model

public class RepositoriesModel {
    var repositoriesArray: [GitRepository] = []
    
    func loadRepositories(repositories: [GitRepository]) {
        repositoriesArray = repositories
        for repository in repositoriesArray {
            print("Repository: \n Name: \(repository.name ?? "") \n IsPrivate: \(repository.isPrivate ?? false) \n Language: \(repository.language ?? "") \n Description: \(repository.description ?? "") \n\n")
        }
    }
}
