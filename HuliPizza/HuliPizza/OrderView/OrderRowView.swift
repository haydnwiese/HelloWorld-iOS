//
//  OrderRowView.swift
//  HuliPizza
//
//  Created by Haydn Wiese on 2020-12-27.
//

import SwiftUI

struct OrderRowView: View {
    var body: some View {
        HStack(alignment:.firstTextBaseline) {
            Text("Your order item here")
            Spacer()
            Text("$0.00")
        }
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView()
    }
}
