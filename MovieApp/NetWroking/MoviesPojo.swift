//
//  MoviesPojo.swift
//  MovieApp
//
//  Created by Anas Salah on 05/05/2024.
//

import Foundation

struct Movie: Codable {
    let rank: Int
    let title: String
    let description: String
    let image: URL
    let bigImage: URL
    let genre: [String]
    let thumbnail: URL
    let rating: String
    let id: String
    let year: Int
    let imdbid: String
    let imdbLink: URL

    enum CodingKeys: String, CodingKey {
        case rank
        case title
        case description
        case image
        case bigImage = "big_image" // Match the key in the JSON data
        case genre
        case thumbnail
        case rating
        case id
        case year
        case imdbid
        case imdbLink = "imdb_link" // Match the key in the JSON data
    }
}


//struct MoviesPojo: Codable {
//    let title: String
//    let year: Int
//    let genre: [String]
//    let rating: Double
//    let poster: String
//}
