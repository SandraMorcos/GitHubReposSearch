//
//  RequestManager.swift
//  GithubReposSearch
//
//  Created by Sandra Morcos on 5/21/21.
//  Copyright © 2021 Sandra Morcos. All rights reserved.
//

import Foundation
import Moya

enum CustomError {
    case failedRequest(error: String?)
    case noDataAvailable
    case parsingError
}

class RequestManager {
    func request<Target: TargetType, Response: Codable>(for targetType: Target.Type,
                                                        responseModel: Response.Type,
                                                        service: Target,
                                                        completion: @escaping (Response?, CustomError?) -> Void) {

        let provider = MoyaProvider<Target>()
        provider.request(service) { result in
            switch result {
            case .success(let moyaResponse):
                    do {
                        let response = try JSONDecoder().decode(responseModel, from: moyaResponse.data)
                        completion(response, nil)
                    } catch {
                        completion(nil, .parsingError)
                    }
            case .failure(let error):
                completion(nil, .failedRequest(error: error.errorDescription))
            }
        }
    }
}
