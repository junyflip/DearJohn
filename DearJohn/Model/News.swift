//
//  News.swift
//  DearJohn
//
//  Created by Lahai on 5/9/19.
//  Copyright © 2019 lolo. All rights reserved.
//

import Foundation
struct News: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
