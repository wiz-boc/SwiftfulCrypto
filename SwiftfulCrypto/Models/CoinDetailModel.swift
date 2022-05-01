//
//  CoinDetailModel.swift
//  SwiftfulCrypto
//
//  Created by wizz on 4/28/22.
//

import Foundation

/*
 https://api.coingecko.com/api/v3/coins/bitcoin?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false
 */


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// MARK: - Welcome
struct CoinDetailModel: Codable {
    let id, symbol, name: String
    let blockTimeInMinutes: Int
    let hashingAlgorithm: String
    let categories: [String]
    let description: Description
    let links: Links
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name
        case blockTimeInMinutes = "block_time_in_minutes"
        case hashingAlgorithm = "hashing_algorithm"
        case categories
        case description
        case links
    }
    
    var readableDescription: String? {
        return description.en.removingHTMLOccurances
    }
}


// MARK: - Links
struct Links: Codable {
    let homepage: [String]
    let subredditURL: String
    
    enum CodingKeys: String, CodingKey {
        case homepage
        case subredditURL = "subreddit_url"
    }
}


// MARK: - Description
struct Description: Codable {
    let en: String
}

