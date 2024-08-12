//
//  CategoryModel.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 11/08/24.
//

import Foundation

struct CategoryModel: Codable, Identifiable {
    enum CodingKeys: CodingKey{
        case id
        case title
        case image
    }
    
    var id: String
    var title: String
    var image: String
    
}


