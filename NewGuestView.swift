//
//  NewCustomerView.swift
//  SundayLove
//
//  Created by Toaster Strudle, Ja! on 8/14/24.
//

import SwiftUI
import PhotosUI


// View for the page to add a new guest
struct NewGuestView: View {
    
    // Defining state variables
    @State private var name: String = ""
    @State private var gender: String = "Male"
    @State private var zip: String = ""
    @State private var custComment: String = ""
    @State private var profPicItem: PhotosPickerItem?
    @State private var profPic: Image?
    @StateObject var imagePickerA = ImagePicker()
    @StateObject var imagePickerB = ImagePicker()
    @State private var birthDate = Date.now
    @State private var dates: Set<DateComponents> = []
    
    // List of genders for dropdown menu
    var genders = ["Male", "Female", "Other", "Prefer Not to Say"]
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                // Title of page
                Text("Add New Guest")
                    .font(.title)
                    .padding()
                
                
                // All input fields vertically arranged and aligned to the left
                VStack(alignment: .leading) {
                    
                    // Input field for customer name
                    HStack {
                        Text("Name:").padding()
                        TextField("", text: $name)
                            .border(.secondary)
                            .padding()
                    }
                    // Input field for guest gender
                    HStack {
                        Text("Gender:").padding()
                        Picker("Gender", selection: $gender) {
                            ForEach(genders, id: \.self) { gender in
                                Text(gender)
                            }
                        }
                    }
                    
                    // Input field for ZIP code
                    HStack {
                        Text("ZIP Code:").padding()
                        TextField("", text: $zip)
                            .border(.secondary)
                            .padding()
                    }
                    
                    // Input field for guest comments
                    HStack {
                        Text("Comments:").padding()
                        TextField("", text: $custComment)
                            .border(.secondary)
                            .padding()
                    }
                    
                    // Input field for guest birthday
                    DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                        Text("Select a Birth Date:").padding()
                    }.padding()
                    
                    // Input field for guest profile picture
                    HStack {
                        PhotosPicker("Select Profile Picture", selection: $imagePickerA.imageSelection).padding()
                        if let image = imagePickerA.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(.black, lineWidth: 4)
                                )
                        }
                    }
                    
                    // Input field for guest ID picture
                    HStack {
                        PhotosPicker("Select ID Picture", selection: $imagePickerB.imageSelection).padding()
                        if let image = imagePickerB.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(.black, lineWidth: 4)
                                )
                        }
                    }
                    
                    // Input field for guests shopping history
                    HStack {
                        MultiDatePicker("Select Shopping History", selection: $dates)
                    }
                    
                    // Submit button
                    Button(action: addNewGuest){
                        Text("Submit")
                    }.padding()
                    
                }
            }
            .textFieldStyle(.roundedBorder)
        }
    
    }
}

struct NewGuestView_Previews: PreviewProvider {
    static var previews: some View {
        NewGuestView()
    }
}
