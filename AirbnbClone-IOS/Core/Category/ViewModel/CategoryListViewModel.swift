//
//  CategoryListViewModel.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 11/08/24.
//

import Foundation

final class CategoryListVM: ObservableObject {
    @Published var categories: [CategoryModel] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    func getCategories() {
        self.isLoading = true

        NetworkManager.shared.getCategories { [self] result in

            DispatchQueue.main.async {
                self.isLoading = false

                switch result {

                case .success(let categories):
                    self.categories = categories

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
