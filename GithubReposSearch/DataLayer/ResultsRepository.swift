//
//  ResultsRepository.swift
//  GithubReposSearch
//
//  Created by Sandra Morcos on 5/22/21.
//  Copyright © 2021 Sandra Morcos. All rights reserved.
//

import RxSwift

class ResultsRepository {
    func fetchResults(keyword: String, pageNumber: Int) -> Single<RepositoriesResponse> {
        return Single.create { (single) -> Disposable in
            RequestManager().request(for: SearchService.self,
                                     responseModel: RepositoriesResponse.self,
                                     service: .searchRepositories(keyword: keyword,
                                                                  pageNumber: pageNumber)) { (result, error)  in
                                                                    guard error == nil, let data = result else {
                                                                        return
                                                                    }
                                                                    single(.success(data))
            }
            return Disposables.create()
        }
    }
}
