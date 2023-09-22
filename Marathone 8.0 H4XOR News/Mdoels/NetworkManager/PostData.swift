//
//  PostData.swift
//  Marathone 8.0 H4XOR News
//
//  Created by Ислам Пулатов on 9/22/23.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
