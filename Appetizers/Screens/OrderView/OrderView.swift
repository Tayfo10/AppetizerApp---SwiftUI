//
//  OrderView.swift
//  Appetizers
//
//  Created by Tayfun Sener on 31.07.2024.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListViewCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    Button {
                        print("Order Placed")
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f")- Place Order")
                            
                    }
                    .padding(.bottom, 30)
                }
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. Please pick items to continue.")
                }
            }
            .navigationTitle("Orders")
        }
    }
    
    
}

#Preview {
    OrderView()
}
