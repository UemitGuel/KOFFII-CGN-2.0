//
//  CoffeeItem.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CafeItem: View {
    
    var cafe: Cafe
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8.0) {
                if cafe.photo {
                    Image(cafe.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)

                } else {
                    Text("in Arbeit :)")
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color.gray)
                }
            }
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(cafe.name)
                        .lineLimit(1)
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.primary)
                    Text("\(cafe.hood.rawValue)\n300m")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.primary).opacity(0.8)
                }
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.top, 8)
            
            HStack {
                Spacer()
                if cafe.hasWifi {
                    Image(systemName: "wifi")
                }
                Spacer()
                if cafe.hasFood {
                    Image("FOOD")
                }
                Spacer()
                if cafe.hasVegan {
                    Image(systemName: "leaf")
                }
                Spacer()
                if cafe.hasPlug {
                    Image(systemName: "bolt")
                }
                Spacer()
            }
            .padding(.vertical)
        }
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
        .shadow(radius: 10)
    }
}


struct CoffeeItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CafeItem(cafe: cafeData[5])
                .preferredColorScheme(.dark)
        }
    }
}
