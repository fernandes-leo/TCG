//
//  SetModel.swift
//  TCG
//
//  Created by Leonardo Fernandes on 27/07/23.
//

import Foundation

struct SetData: Codable {
    var data: [Set]
}

struct Set: Codable, Identifiable {
    let id: String
    let name: String
    let series: String
    let printedTotal: Int
    let total: Int
    let legalities: Legalities
    let ptcgoCode: String?
    let releaseDate: String
    let updatedAt: String
    let images: Images
    
    var updatedAtDate: Date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
            return dateFormatter.date(from: updatedAt) ?? Date()
        }
}

struct Legalities: Codable {
    let unlimited: String
}

struct Images: Codable {
    let symbol: String
    let logo: String
}
