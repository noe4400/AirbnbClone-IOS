//
//  ListingController.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 09/08/24.
//

import Foundation

@MainActor
final class ListingListViewModel: ObservableObject {
    @Published var listings: [ListingDataModel] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?

    func getListings() {
        isLoading = true

        NetworkManager.shared.getListings { [self] result in

            DispatchQueue.main.async {
                self.isLoading = false

                switch result {

                case .success(let listings):
                    self.listings = listings

                case .failure(let error):
                    switch error {
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData

                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL

                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse

                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }

                }
            }

        }

    }
}
