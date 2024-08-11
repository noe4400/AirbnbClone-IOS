//
//  ListingModel.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 10/08/24.
//

import Foundation

struct ListingDataModel: Codable, Identifiable {
    var id = UUID()
    var listing: ListingModel
    var priceData: PriceData?
    var checkInOut: ListingParamOverrides?

    enum CodingKeys: String, CodingKey {
        case listing
        case priceData = "pricingQuote"
        case checkInOut = "listingParamOverrides"
    }

    init(
        listing: ListingModel, priceData: PriceData?,
        checkInOut: ListingParamOverrides?
    ) {
        self.listing = listing
        self.priceData = priceData
        self.checkInOut = checkInOut
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.listing = try container.decode(ListingModel.self, forKey: .listing)

        if let priceData = try? container.decode(
            PricingQuote.self, forKey: .priceData)
        {
            self.priceData = priceData.structuredStayDisplayPrice.primaryLine
        } else {
            self.priceData = nil
        }

        if let checkInOut = try? container.decode(
            ListingParamOverrides.self, forKey: .checkInOut)
        {
            self.checkInOut = checkInOut
        } else {
            self.checkInOut = nil
        }

    }

}

struct ListingParamOverrides: Codable {
    var checkin: String
    var checkout: String
}

struct PricingQuote: Codable {
    var structuredStayDisplayPrice: StructuredStayDisplayPrice
}

struct StructuredStayDisplayPrice: Codable {
    var primaryLine: PriceData
}

struct PriceData: Codable {
    var price: String
    var qualifier: String
}

struct ListingModel: Codable, Identifiable {
    var id: String
    var name: String
    var title: String
    var avgRatingLocalized: String
    var contextualPictures: [ContextualPicture]
    var formattedBadges: [FormattedBadge]

}

struct ContextualPicture: Codable, Identifiable {
    var id: String
    var picture: String
}

struct FormattedBadge: Codable {
    var text: String
}
