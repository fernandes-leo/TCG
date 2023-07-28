//
//  SetViewModel.swift
//  TCG
//
//  Created by Leonardo Fernandes on 27/07/23.
//

import Foundation

class SetViewModel: ObservableObject {
    @Published var sets = [Set]()

    init() {
        fetchSets()
    }

    func fetchSets() {
        guard let url = URL(string: "https://api.pokemontcg.io/v2/sets/") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            if let data = data {
                do {
                    var decodedData = try JSONDecoder().decode(SetData.self, from: data)
                    // Ordenar os conjuntos pelo updatedAtDate (último para o primeiro)
                    decodedData.data.sort(by: { $0.releaseDate > $1.releaseDate })
                    let filteredSets = decodedData.data.filter { $0.legalities.unlimited == "Legal" }
                    DispatchQueue.main.async {
                        self.sets = decodedData.data
                        self.sets = filteredSets
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}
