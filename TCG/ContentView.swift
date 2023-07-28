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
                HStack() {
                    if let imageURL = URL(string: set.images.logo) {
                        // Use a função "AsyncImage" para carregar a imagem assincronamente
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        } placeholder: {
                            // Exibe um placeholder enquanto a imagem está sendo carregada
//                            Color.gray
//                                .frame(width: 80, height: 80)
                        }
                    }
                    Spacer()
                    VStack(alignment: .center){
                        Text(set.name)
                            .font(.headline)
                        Text(set.series)
                            .font(.subheadline)
                    }
                    Spacer()
                }
            }
            .navigationTitle("Coleções")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
