//
//  CategoryList.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 11/08/24.
//

import SwiftUI

struct CategoryList: View {
    @StateObject private var categoriesData = CategoryListVM()
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(categoriesData.categories) { category in
                       
                        CategoryItem(category: category)

                    }
                }

            }

        }
        .onAppear{
            categoriesData.getCategories()
        }
        .alert(item: $categoriesData.alertItem) { alertItem in

            Alert(
                title: alertItem.title, message: alertItem.message,
                dismissButton: alertItem.dismissButton)

        }
        .frame(height: 72)
   
    }
}

#Preview {
    CategoryList()
}
