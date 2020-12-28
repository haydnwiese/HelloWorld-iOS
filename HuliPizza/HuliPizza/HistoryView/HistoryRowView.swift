//
//  HistoryRowView.swift
//  HuliPizza
//
//  Created by Haydn Wiese on 2020-12-27.
//

import SwiftUI

struct HistoryRowView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("1_100w")
            Text("Huli Chicken")
        }
    }
}

struct HistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRowView()
    }
}
