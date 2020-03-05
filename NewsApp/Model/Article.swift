//
//  Article.swift
//  NewsApp
//
//  Created by Lucifer on 2/29/20.
//  Copyright © 2020 Lucifer. All rights reserved.
//

import Foundation

struct Article {
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var sourceName: String
    
    init(dictonary: Dictionary<String, Any>) {
        author = dictonary["author"] as? String ?? ""
        title = dictonary["title"] as? String ?? ""
        description = dictonary["description"] as? String ?? ""
        url = dictonary["url"] as? String ?? ""
        urlToImage = dictonary["urlToImage"] as? String ?? ""
        publishedAt = dictonary["publishedAt"] as? String ?? ""
        
        sourceName = (dictonary["source"] as? Dictionary<String, Any> ?? ["":""])["name"] as? String ?? ""
        

    }
}

