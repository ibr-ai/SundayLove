//
//  SearchGuestView.swift
//  SundayLove
//
//  Created by Toaster Strudle, Ja! on 8/26/24.
//

import SwiftUI

struct SearchGuestView: View {
    
    // State variable for name entry
    @State private var nameToSearch: String = ""
    
    var body: some View {
        
        VStack {
            // Title of page
            Text("Search Guests")
                .font(.title)
                .padding()
            
            TextField("Enter Name", text: $nameToSearch)
                .padding()
            
            Button(action: searchGuests){
                Text("Search")
            }
        }
        
    }
}

struct SearchGuestView_Previews: PreviewProvider {
    static var previews: some View {
        SearchGuestView()
    }
}
