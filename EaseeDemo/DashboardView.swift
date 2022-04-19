//
//  ContentView.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 14.04.22.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack {
            ProductCardView()
                .edgesIgnoringSafeArea(.bottom)
        }
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .navigationTitle("My Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button{
                    
                } label: {
                    Image(systemName: "chevron.down")
                }
            }
        }
        .foregroundColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        DashboardView()
        }
        .preferredColorScheme(.dark)
        
        NavigationView {
        DashboardView()
        }
        .preferredColorScheme(.light)
    }
}
