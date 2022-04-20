//
//  ProfileView.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 19.04.22.
//

import SwiftUI

struct ContentView: View {
    @State var selection: String? = "home"
    var body: some View {
        NavigationView {
            List {
                #if os(iOS)
                profileHeader
                #endif
                listContent
            }
            .navigationTitle("easee")
            
            #if os(iOS)
            .listStyle(.sidebar)
            .navigationBarTitleDisplayMode(.inline)
            #endif
        }
    }
    
    // MARK: - List content
    @ViewBuilder var listContent: some View {
        Group{
            Section("Locations") {
                NavigationLink(tag: "home", selection: $selection){
                    LocationView()
                        .navigationTitle("Home")
                } label: {
                    Label("Home", systemImage: "bolt.car")
                }
                NavigationLink(tag: "cabin", selection: $selection){
                    LocationView()
                        .navigationTitle("Cabin")
                } label: {
                    Label("Cabin", systemImage: "bolt.car")
                }
            }
            
            Section("My easee") {
                keyLink
                TestLink(title: "Settings", image: "gear")
                TestLink(title: "Notifications", image: "bell.badge")
            }
            #if os(watchOS)
            profileHeader
            #else
            TestLink(title: "Support", image: "questionmark.circle")
            Label("Log out", systemImage: "rectangle.portrait.and.arrow.right")
            #endif
        }
        #if os(iOS)
        .listItemTint(.secondary)
        #endif
    }
    
    // MARK: header
    var profileHeader: some View {
        NavigationLink {
            Text("Profile")
                .navigationTitle("Profile")
        } label: {
            #if os(iOS)
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                    .symbolRenderingMode(.hierarchical)
                VStack(alignment: .leading) {
                    Text("Marco")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Show Profile")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.leading, 8)
            }
            #else
            Label("Profile", systemImage: "person.crop.circle.fill")
            #endif
        }
    }
    
    var keyLink: some View {
        NavigationLink{
            Text("Test")
                .navigationTitle("Keys")
        } label: {
            HStack {
                Label("Easee Keys", systemImage: "key")
                Spacer()
                Text("0")
                    .foregroundStyle(.tertiary)
            }
        }
    }
}

// MARK: - Preview
struct Sidebarview_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
            .preferredColorScheme(.dark)
    }
}

struct TestLink: View {
    var title: String
    var image: String
    var body: some View {
        NavigationLink{
            Text("Test")
                .navigationTitle(title)
        } label: {
            Label(title, systemImage: image)
        }
    }
}
