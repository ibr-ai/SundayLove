//
//  ContentView.swift
//  SundayLove
//
//  Created by Toaster Strudle, Ja! on 8/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()*/
        
        // TabView to switch between the different views of the app
        TabView{
            
            // Search view and tab
            SearchGuestView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            // New guest view and tab
            NewGuestView()
                .tabItem {
                    Label("Add New Guest", systemImage: "person.crop.circle.fill")
                }
            
            // Report generator view and tab
            ReportView()
                .tabItem {
                    Label("Generate Report", systemImage: "square.and.pencil")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
