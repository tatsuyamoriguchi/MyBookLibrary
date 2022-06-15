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
//    let saleInfo: SaleInfo
//    let accessInfo: AccessInfo
//    let searchInfo: SearchInfo
}


struct VolumeInfo: Codable {
    let title: String
    let subtitle: String?
    let authors: [String]
    let publishedDate: String
    let description: String?
    let industryIdentifiers: [IndustryIdentifier]
    let printType: String
    let infoLink: URL
    
}

struct IndustryIdentifier: Codable {
    let type: String
    let identifier: String
}

//struct SaleInfo: Codable {
//
//}
//
//struct AccessInfo: Codable {
//
//}
//
//struct SearchInfo: Codable {
//
//}
