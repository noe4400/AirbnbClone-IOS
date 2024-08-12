//
//  CategoryItem.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 11/08/24.
//

import SwiftUI

struct CategoryItem: View {
    var category: CategoryModel
    @State var isLoading: Bool = false

    var body: some View {
        VStack(spacing: 5) {
            AsyncImage(url: URL(string: category.image)) { phase in
                switch phase {
                case .failure:
                    Image(systemName: "photo").onAppear { isLoading = false }
                case .success(let image):
                    image.resizable()
                      

                default:
                    Circle()
                        .foregroundColor(.gray)
                       

                }
            }
            .frame(width: 24, height: 25)
            
            Text(category.title)
                .font(.system(size: 12))
                .fontWeight(.semibold)
                .redacted(reason: isLoading ? .placeholder : [])
        }.padding(.leading, 24)
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        let mockCategory = CategoryModel(
            id: "TAB_677", title: "Amazing pools",
            image:
                "https://a0.muscache.com/pictures/3fb523a0-b622-4368-8142-b5e03df7549b.jpg"
        )
        CategoryItem(category: mockCategory)
    }

}
