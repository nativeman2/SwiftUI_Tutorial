//
//  ModelData.swift
//  Landmarks
//
//  Created by Ayodeji Onipe on 2021-07-27.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
//    var landmarks: [Landmark] = load("landmarkData.json")
    // an observable object needs to publish any changes to its data,
    // so that its subscribers can pick up the change.
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")

}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
