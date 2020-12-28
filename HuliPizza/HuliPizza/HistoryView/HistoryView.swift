//
//  HistoryView.swift
//  HuliPizza
//
//  Created by Haydn Wiese on 2020-12-27.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        VStack {
            ContentHeaderView()
            PageTitleView(title: "Pizza History")
            HistoryListView()
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
