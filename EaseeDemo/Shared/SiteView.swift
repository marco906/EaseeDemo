//
//  ContentView.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 14.04.22.
//

import SwiftUI

struct SiteView: View {
    @State var site: ChargeSite
    
    var body: some View {
        #if os(watchOS)
        // watch
        ProductCardPageView(site: site, offset: .constant(0))
            .navigationTitle(site.name)
        #else
        Group {
            if horizontalSizeClass == .compact {
                // MARK: iPhone and ipad compact
                ZStack {
                    SiteDetailView()
                    ProductCardPageView(site: site, offset: $offset)
                        .offset(x: 0, y: offset)
                }
                .navigationBarTitleDisplayMode(.inline)
                // toolbar
                .toolbar{
                    ToolbarItem(placement: .primaryAction) {
                        productCardButton
                    }
                }
            } else {
                // MARK: iPad landscape, macOS
                HStack {
                    SiteDetailView()
                    Spacer()
                    ProductCardPageView(site: site, offset: $offset)
                        .padding(.vertical)
                        .padding(.trailing)
                        .frame(minWidth: 400)
                }
                
            }
        }
        .foregroundColor(.primary)
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .navigationTitle(site.name)
        #endif
        
    }
    
    // iOS additional Components
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State var offset = CGFloat.zero
    var maxOffset: CGFloat = 370
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
            SiteView(site: .preview)
        }
        .environmentObject(Model())
        .preferredColorScheme(.dark)
        
        NavigationView {
        SiteView(site: .preview)
        }
        .environmentObject(Model())
        .preferredColorScheme(.light)
    }
}
