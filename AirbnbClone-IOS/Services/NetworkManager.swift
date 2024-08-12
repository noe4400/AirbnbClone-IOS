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
    
    func featchData<T: Decodable>(
        resourceName: String,
        as type: T.Type,
        completed: @escaping (Result<T, NetworkError>) -> Void
    ) {
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: "json") else {
            completed(.failure(.invalidURL))
            return
        }
        print("url", url)
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if error != nil {
                print("error nil")
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
                print("failing data")
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(T.self, from: data)
                completed(.success(decodedResponse))
            } catch {
                print("invalid data from catch", error)
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    

    func getListings(completed: @escaping (Result<[ListingDataModel], NetworkError>) -> Void) {
        featchData(resourceName: "TAB_677", as: [ListingDataModel].self, completed: completed)
    }
    
    func getCategories(completed: @escaping (Result<[CategoryModel], NetworkError>) -> Void) {
        featchData(resourceName: "categories", as: [CategoryModel].self, completed: completed)
    }
    
}

enum NetworkError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}
