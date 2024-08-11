//
//  ListingItemLoading.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 11/08/24.
//

import SwiftUI

struct ListingItemLoading: View {
    let loadingShape = Color(.init(gray: 0.9, alpha: 1.0))
    var body: some View {
        VStack(spacing: 20) {
            loadingShape
                .frame(height: 327)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .foregroundStyle(.gray)

            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    loadingShape.frame(width: 150, height: 15).cornerRadius(5)
                    loadingShape.frame(width: 100, height: 15).cornerRadius(5)
                    loadingShape.frame(width: 70, height: 15).cornerRadius(5)
                    loadingShape.frame(width: 70, height: 15).cornerRadius(5)
                }
                Spacer()
                loadingShape.frame(width: 50, height: 15).cornerRadius(5)

            }
        }

    }
}

#Preview {
    ListingItemLoading()
}
