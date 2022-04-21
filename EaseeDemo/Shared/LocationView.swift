//
//  ContentView.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 14.04.22.
//

import SwiftUI

struct LocationView: View {
    @State var location: ChargeLocation
    
    var body: some View {
        #if os(watchOS)
        // watch
        ProductCardPageView(location: location, offset: .constant(0))
            .navigationTitle(location.name)
        #else
        Group {
            if horizontalSizeClass == .compact {
                // iphone and ipad compact
                ZStack {
                    LocationDetailView()
                    ProductCardPageView(location: location, offset: $offset)
                        .offset(x: 0, y: offset)
                }
                //.background(Color(uiColor: .secondarySystemGroupedBackground))
                .navigationBarTitleDisplayMode(.inline)
                // toolbar
                .toolbar{
                    ToolbarItem(placement: .primaryAction) {
                        productCardButton
                    }
                }
            } else {
                // ipad landscape, macOS
                HStack {
                    LocationDetailView()
                    Spacer()
                    ProductCardPageView(location: location, offset: $offset)
                        .padding(.vertical)
                        .padding(.trailing)
                        .frame(minWidth: 400)
                }
                
            }
        }
        .foregroundColor(.primary)
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .navigationTitle(location.name)
        #endif
        
    }
    
    // iOS additional Components
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State var offset = CGFloat.zero
    var maxOffset: CGFloat = 380
    var maxRotation: CGFloat = 180
    
    var productCardButton: some View {
        Button {
            withAnimation(.spring()){
            offset = offset == 0 ? maxOffset : 0
            }
        } label: {
            Image(systemName: "chevron.down")
                .rotationEffect(Angle(degrees: (offset / maxOffset * maxRotation)))
        }
    }
    #endif
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocationView(location: .preview)
        }
        .environmentObject(Model())
        .preferredColorScheme(.dark)
        
        NavigationView {
        LocationView(location: .preview)
        }
        .environmentObject(Model())
        .preferredColorScheme(.light)
    }
}
