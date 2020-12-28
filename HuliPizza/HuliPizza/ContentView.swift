//
//  ContentView.swift
//  HuliPizza
//
//  Created by Haydn Wiese on 2020-12-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ContentHeaderView()
            PageTitleView(title: "Order Pizza")
            MenuListView()
            OrderListView()
            
            Spacer()
        }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .colorScheme(.dark)
                .background(Color.black)
        }
    }
}
