//
//  ImagePicker.swift
//  SundayLove
//
//  Created by Toaster Strudle, Ja! on 8/15/24.
//

import SwiftUI
import PhotosUI

// Class defining the photo selection functionality
@MainActor
class ImagePicker: ObservableObject {
    
    // Defining our publishers
    @Published var image: Image?
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                Task {
                    try await loadTransferable(from:imageSelection)
                }
            }
        }
    }
    
    func loadTransferable(from imageSelection: PhotosPickerItem?) async throws {
        do {
            if let data = try await imageSelection?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    self.image = Image(uiImage: uiImage)
                }
            }
        } catch {
            print(error.localizedDescription)
            image = nil
        }
    }
    
}
