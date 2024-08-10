//
//  SearchBarAndFilters.swift
//  AirbnbClone-IOS
//
//  Created by Fabian Garcia on 10/08/24.
//

import SwiftUI

struct SearchBarAndFilters: View {
    var body: some View {
        HStack() {
            HStack {
                Image(systemName: "magnifyingglass")
                VStack(alignment: .leading) {
                    Text("Where to?")
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                    HStack {
                        Text("Anywhere")
                        Text("Any week")
                        Text("Add guests")
                    }.foregroundColor(.gray)
                        .font(.caption)

                }
            }
            
            .padding(.horizontal, 25)
            .padding(.vertical, 10)
            .padding(.trailing, 30)
            .background(
                Rectangle()
                    .fill(.white)
                    .cornerRadius(30)
                    .shadow(color: .gray.opacity(0.2), radius: 10)
            )
      
            Spacer()

            Button(action: {}) {
                Image(systemName: "gear")
                    .foregroundStyle(.black)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 0.2)
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color.black)

                    }
            }

        }.padding(.horizontal, 24)

        
    }
}

#Preview {
    SearchBarAndFilters()
}
