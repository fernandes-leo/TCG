//
//  ContentView.swift
//  TCG
//
//  Created by Leonardo Fernandes on 27/07/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var setViewModel = SetViewModel()

    var body: some View {
        NavigationView {
            List(setViewModel.sets) { set in
                VStack(alignment: .leading) {
                    if let imageURL = URL(string: set.images.symbol) {
                        // Use a função "AsyncImage" para carregar a imagem assincronamente
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        } placeholder: {
                            // Exibe um placeholder enquanto a imagem está sendo carregada
                            Color.gray
                                .frame(width: 80, height: 80)
                        }
                    }

                    Text(set.name)
                        .font(.headline)
                    Text(set.series)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Pokemon Sets")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
