//
//  Model.swift
//  NewsApp
//
//  Created by Lucifer on 3/3/20.
//  Copyright © 2020 Lucifer. All rights reserved.
//

import Foundation

var articles: [Article] = []

var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}

func loadNews(completionHandler: (() -> Void)?) {
    
    let IdUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a097859cf3ef49d9ad0a1753719269fb"
    let url = URL(string: IdUrl)
    let session = URLSession(configuration: .default)
    let downloadTask = session.downloadTask(with: url!) { (urlFile, responce, error) in
        if urlFile != nil {
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            parseNews()
            completionHandler?()
            
        }
    }
    downloadTask.resume()
}

func parseNews() {
    let data = try? Data(contentsOf: urlToData)
    if data == nil { return }
    
    let rootDictonaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, Any>
    if rootDictonaryAny == nil { return }
    
    let rootDictonary = rootDictonaryAny
    if rootDictonary == nil { return }
    
    if let array = rootDictonary!["articles"] as? [Dictionary<String, Any>] {
        
        var returnArray: [Article] = []
        
        for dict in array {
            let newArticle = Article(dictonary: dict)
            returnArray.append(newArticle)
        }
        articles = returnArray
    }
}

