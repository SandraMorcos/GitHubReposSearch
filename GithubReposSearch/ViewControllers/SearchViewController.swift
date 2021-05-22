//
//  SearchViewController.swift
//  GithubReposSearch
//
//  Created by Sandra Morcos on 5/21/21.
//  Copyright © 2021 Sandra Morcos. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchBar.delegate = self
        searchController?.searchBar.placeholder = "Search Repositories"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text,
            let resultsViewController = storyboard?
            .instantiateViewController(withIdentifier: Storyboards.ViewControllers.results.rawValue)
            as? ResultsViewController else {
            return
        }
        let viewModel = ResultsViewModel(repository: ResultsRepository(), keyWord: keyword)
        resultsViewController.viewModel = viewModel
        navigationController?.pushViewController(resultsViewController, animated: true)
    }
}
