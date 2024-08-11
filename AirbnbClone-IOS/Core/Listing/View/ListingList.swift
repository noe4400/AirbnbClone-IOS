//
//  ListingList.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 11/08/24.
//

import SwiftUI

struct ListingList: View {
    @StateObject private var listingListViewModel = ListingListViewModel()

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 20) {
                ForEach(listingListViewModel.listings) { listingItem in
                    ListingItem(listingData: listingItem)

                }
                
                if(listingListViewModel.isLoading){
                    ForEach(0...4, id: \.self){ _ in
                        ListingItemLoading()
                    }
                }
            }.onAppear {
                listingListViewModel.getListings()
            }

        }.padding(.horizontal, 24)
            .alert(item: $listingListViewModel.alertItem) { alertItem in

                Alert(
                    title: alertItem.title, message: alertItem.message,
                    dismissButton: alertItem.dismissButton)

            }
    }
}

#Preview {
    ListingList()
}
