//
//  GitHubCrawlerLibraryTests.swift
//  GitHubCrawlerLibraryTests
//
//  Created by Tejas, Dhanuka on 2019/12/11.
//  Copyright © 2019 Tejas, Dhanuka. All rights reserved.
//

import XCTest
@testable import GitHubCrawlerLibrary

class GitHubCrawlerLibraryTests: XCTestCase {
    
    var gitHubCrawlerLibrary: GitHubCrawlerLibrary!

    override func setUp() {
        gitHubCrawlerLibrary = GitHubCrawlerLibrary()
    }
    
    func testFetchGitRepos() {
        gitHubCrawlerLibrary.fetchGitRepos(for: "iOS", dept: "rakutentech")
        sleep(10)
        XCTAssertNotNil(gitHubCrawlerLibrary.model, "Has data in model")
    }

}
