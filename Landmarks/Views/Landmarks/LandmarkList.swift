//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Ayodeji Onipe on 2021-07-27.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    
    // State is a value, or a set of values, that can change
    // over time, and that affects a view's behaviour, content
    // or layout. You use a property with the @State attribute
    // to add state to a view.
    @State private var showFavoritesOnly = false
    
    // compute a filtered version of the landmarks list by
    // checking the showFavoritesOnly property and each
    // landmark.isFavorite value.
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
