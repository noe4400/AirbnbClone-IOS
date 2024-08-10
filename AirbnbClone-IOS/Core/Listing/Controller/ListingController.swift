//
//  ListingController.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 09/08/24.
//

import Foundation

@MainActor
class ListingController: ObservableObject {
    @Published var listings = [ListingDataModel]()
    @Published var isLoading: Bool = false
    @Published var errMessage: String? = nil

    init() {
        Task {
            await fetchListings()
        }

    }

    func fetchListings() async {
        isLoading = true
        do {
            guard
                let url = Bundle.main.url(
                    forResource: "TAB_677", withExtension: "json")
            else {
                errMessage = "File not found"
                return
            }

            let (data, _) = try await URLSession.shared.data(from: url)
            let listings = try JSONDecoder().decode(
                [ListingDataModel].self, from: data)
            self.listings = listings
        } catch let err {
            self.errMessage = err.localizedDescription
            self.listings = []

        }

    }
}
