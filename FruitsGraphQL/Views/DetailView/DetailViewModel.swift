//
//  DetailViewModel.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/28/22.
//

import Foundation
import Apollo
import Combine

protocol DetailViewModelRepresentable: AnyObject {
    var launchSubject: PassthroughSubject<LaunchDetails, Error> { get set}
    func loadDetails()
}

final class DetailViewModel {
    let apiManager: ApiManagerDetailRepresentable
    let launchId: ID
    var launchSubject: PassthroughSubject<LaunchDetails, Error> = .init()

    init(apiManager: ApiManagerDetailRepresentable = APIManager(), launchID: ID) {
        self.launchId = launchID
        self.apiManager = apiManager
        loadDetails()
    }
}

extension DetailViewModel: DetailViewModelRepresentable {
    func loadDetails() {
        apiManager.loadDetails(launchId: launchId).sink { [unowned self] completion in
            switch completion {
            case .failure(let error):
                launchSubject.send(completion: .failure(error))
            case .finished:
                launchSubject.send(completion: .finished)
            }
        } receiveValue: { [unowned self] launch in
            launchSubject.send(launch)
        }
    }
}
