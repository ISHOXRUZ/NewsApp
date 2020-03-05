//
//  OneNewsViewController.swift
//  NewsApp
//
//  Created by Lucifer on 3/4/20.
//  Copyright © 2020 Lucifer. All rights reserved.
//

import UIKit

class OneNewsViewController: UIViewController {
    
    var article: Article!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = article.title
        labelDescription.text = article.description
        
        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
        
    }
}
