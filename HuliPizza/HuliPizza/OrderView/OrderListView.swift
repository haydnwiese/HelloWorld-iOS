//
//  OrderListView.swift
//  HuliPizza
//
//  Created by Haydn Wiese on 2020-12-27.
//

import SwiftUI

struct OrderListView: View {
    var body: some View {
        VStack {
            Text("Your Order")
            List(0 ..< 5) { item in
                OrderRowView()
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
