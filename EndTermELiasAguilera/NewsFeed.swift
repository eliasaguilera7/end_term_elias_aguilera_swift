//
//  NewsFeed.swift
//  EndTermELiasAguilera
//
//  Created by Elias Aguilera Yambay on 2020-08-06.
//  Copyright © 2020 Elias Aguilera Yambay. All rights reserved.
//

import Foundation

struct NewsFeed: Codable {
    var status: String = ""
    var totalResults: Int = 0
    var articles:[Article]?
}
