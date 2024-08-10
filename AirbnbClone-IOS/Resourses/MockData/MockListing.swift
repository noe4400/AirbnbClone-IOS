//
//  MockListing.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 10/08/24.
//


struct MockListing {

    static let sampleListing = ListingModel(
        id: "listing1",
        name: "Cozy Cottage",
        title: "Charming Cottage in the Countryside",
        avgRatingLocalized: "4.9",
        contextualPictures: [
            ContextualPicture(id: "pic1", picture: "https://a0.muscache.com/im/pictures/miso/Hosting-792223142947046509/original/7c638124-8072-4e82-9355-12431a5c243f.jpeg?im_w=720"),
            ContextualPicture(id: "pic2", picture:   "https://a0.muscache.com/im/pictures/miso/Hosting-792223142947046509/original/22e753b5-c520-4cda-a86d-bdca35177799.jpeg?im_w=720")
        ],
        formattedBadges: [
            FormattedBadge(text: "Top Rated"),
        ]
    )

    static let samplePriceData = PriceData(
        price: "$150",
        qualifier: "per night"
    )

    static let sampleCheckInOut = ListingParamOverrides(
        checkin: "2024-09-01",
        checkout: "2024-09-10"
    )
    
    static let sampleListingDataModel = ListingDataModel(listing: sampleListing, priceData: samplePriceData, checkInOut: sampleCheckInOut )
}
