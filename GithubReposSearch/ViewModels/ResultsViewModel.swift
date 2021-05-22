//
//  ResultsViewModel.swift
//  GithubReposSearch
//
//  Created by Sandra Morcos on 5/22/21.
//  Copyright © 2021 Sandra Morcos. All rights reserved.
//

import RxSwift
import RxCocoa

class ResultsViewModel {
    var dataSource: BehaviorRelay<[RepositoryInfo]>
    var totalItems: Int = 0
    var repository: ResultsRepository
    var keyWord: String
    var currentPageNumber = 0
    var shouldLoadMore = true
    private let disposeBag = DisposeBag()
    
    init(repository: ResultsRepository, keyWord: String) {
        dataSource = BehaviorRelay(value: [])
        self.repository = repository
        self.keyWord = keyWord
        fetchResults()
    }
    
    func fetchResults() {
        guard shouldLoadMore else { return }
        repository.fetchResults(keyword: keyWord,
                                pageNumber: currentPageNumber)
            .map({ [weak self](response) in
                guard let `self` = self,
                    let data = response.items else { return }
                let newValue = self.dataSource.value + data
                self.dataSource.accept(newValue)
                self.totalItems = response.totalCount ?? 0
                if self.dataSource.value.count < self.totalItems {
                    self.currentPageNumber += 1
                } else {
                    self.shouldLoadMore = false
                }
            })
            .subscribe()
            .disposed(by: disposeBag)
    }
}


