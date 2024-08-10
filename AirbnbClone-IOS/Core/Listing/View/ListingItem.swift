//
//  ListingView.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 09/08/24.
//

import SwiftUI

struct ListingItem: View {
    let listingData: ListingDataModel

    var body: some View {

        VStack(spacing: 8) {

            ZStack(alignment: .topLeading) {

                TabView {
                    ForEach(listingData.listing.contextualPictures) {
                        image in
                        AsyncImage(url: URL(string: image.picture)) {
                            loadedImage in
                            GeometryReader { geometry in
                                loadedImage.resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width)
                                    .clipped()
                            }

                        } placeholder: {
                            ProgressView()
                        }

                    }
                }
                .frame(height: 327)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .tabViewStyle(PageTabViewStyle())
                HStack {
                    if listingData.listing.formattedBadges.count > 0 {
                        Text("\(listingData.listing.formattedBadges[0].text)")
                            .font(.caption).fontWeight(.semibold)
                            .padding(7).background(Color.white).foregroundStyle(
                                Color.black
                            ).clipShape(Capsule())
                    } else {
                        EmptyView()
                    }

                    Spacer()
                    Image(systemName: "heart")
                        .foregroundStyle(.white)

                }.padding()

            }

            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(listingData.listing.title)
                        .fontWeight(.semibold)

                    Text("Aug 31 - Sep 5")
                        .foregroundStyle(.gray)
                    HStack(spacing: 3) {
                        Text(
                            "\(listingData.priceData?.price ?? "")"
                        ).fontWeight(.semibold)
                        Text(
                            "\(listingData.priceData?.qualifier ?? "")"
                        )
                    }

                }
                Spacer()

                HStack {
                    Image(systemName: "star.fill")
                    Text("\(listingData.listing.avgRatingLocalized)")
                }
            }

        }

    }
}

struct ListingItem_Previews: PreviewProvider {
    static var previews: some View {

        ListingItem(listingData: MockListing.sampleListingDataModel)
    }

}
