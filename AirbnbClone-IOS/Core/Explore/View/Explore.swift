//
//  Explore.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 10/08/24.
//

import SwiftUI

struct Explore: View {
    @ObservedObject var data = ListingController()
    var body: some View {
        VStack(spacing: 0){
            VStack{
                SearchBarAndFilters()
            }
            .padding(.vertical)
            .background(
                Color.white
                    .shadow(
                        color: Color.black.opacity(0.05), radius: 4, y: 4)
            )
            
            ScrollView(showsIndicators: false){
                LazyVStack(spacing: 20){
                    ForEach(data.listings){ listingItem in
                        ListingItem(listingData: listingItem)
                        
                    }
                }
            }.padding(.horizontal, 24)
            
            
        }
    }
}

#Preview {
    Explore()
}
