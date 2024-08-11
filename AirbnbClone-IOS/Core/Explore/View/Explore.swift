//
//  Explore.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 10/08/24.
//

import SwiftUI

struct Explore: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                SearchBarAndFilters()
            }
            .padding(.vertical)
            .background(
                Color.white
                    .shadow(
                        color: Color.black.opacity(0.05), radius: 4, y: 4)
            )

            ListingList()
        }
    }
}

#Preview {
    Explore()
}
