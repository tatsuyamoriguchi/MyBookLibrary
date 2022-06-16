//
//  BookData.swift
//  MyBookLibrary
//
//  Created by Tatsuya Moriguchi on 6/15/22.
//

import Foundation

struct Result: Codable {
    let totalItems: Int
    let items: [Item]
}

struct Item: Codable {
    let volumeInfo: VolumeInfo
}


struct VolumeInfo: Codable {
    let title: String?
    let subtitle: String?
    let authors: [String]?
    let publishedDate: String?
    let description: String?
    let industryIdentifiers: [IndustryIdentifier]?
    let printType: String?
    let imageLinks: ImageLink?
    let infoLink: String?
}

struct ImageLink: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}
struct IndustryIdentifier: Codable {
    let type: String?
    let identifier: String?
}

