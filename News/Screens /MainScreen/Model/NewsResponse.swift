//
//  NewsResponse.swift
//  News
//
//  Created by Aisha Madalieva on 10/01/25.
//

import Foundation
struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let name: String?
    let author: String?
    let title: String
    let description: String?
    let publishedAt: String
    let content: String?


}
