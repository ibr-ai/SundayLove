//
//  ReportView.swift
//  SundayLove
//
//  Created by Toaster Strudle, Ja! on 8/26/24.
//

import SwiftUI

struct ReportView: View {
    
    // State variables for start and end date
    @State private var startDate = Date.now
    @State private var endDate = Date.now
    
    var body: some View {
        VStack {
            
            // Title of the page
            Text("Activity Report")
                .font(.title)
                .padding()
            
            // Input field for starting date
            DatePicker(selection: $startDate, in: ...Date.now, displayedComponents: .date) {
                Text("Select a Start Date:").padding()
            }.padding()
            
            // Input field for ending date
            DatePicker(selection: $endDate, in: ...Date.now, displayedComponents: .date) {
                Text("Select an End Date:").padding()
            }.padding()
            
            // Submit button
            Button(action: generateReport) {
                Text("Generate Report")
            }
            
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
