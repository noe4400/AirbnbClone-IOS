//
//  NetworkManager.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 11/08/24.
//
import Foundation

class NetworkManager: NSObject {
    static let shared = NetworkManager()
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func getListings(
        completed: @escaping (Result<[ListingDataModel], NetworkError>) -> Void
    ) {
        guard
            let url = Bundle.main.url(
                forResource: "TAB_677", withExtension: "json")
        else {
            completed(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {
            data, response, error in

            if error != nil {
                completed(.failure(.unableToComplete))
                return
            }
            // comment out this part as this request comes from a json file wil be use when api is integrated
            //            guard let response = response as? HTTPURLResponse,
            //                response.statusCode == 200
            //            else {
            //                completed(.failure(.invalidResponse))
            //                return
            //            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(
                    [ListingDataModel].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                print("invalid data from catch", error)
                completed(.failure(.invalidData))
            }

        }

        task.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}
