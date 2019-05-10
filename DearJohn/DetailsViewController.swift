//
//  DetailsViewController.swift
//  DearJohn
//
//  Created by Lahai on 5/9/19.
//  Copyright © 2019 lolo. All rights reserved.
//

import UIKit
import Alamofire

class DetailsViewController: UIViewController {
    
    //MARK:- Variables
    var article : Article
    let articleTitle : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.isHighlighted = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let articleDescription : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let articleAuthor : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 254/255, green: 80/255, blue: 85/255, alpha: 1.0)
        label.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let articleImage: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let content : UITextView = {
        let textView = UITextView()
        textView.textColor =  .black
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    //MARK:- Init
    init(article:Article) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = UIColor(red: 254/255, green: 80/255, blue: 85/255, alpha: 1.0)

        navigationItem.title = article.source?.name
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        setupView()
    }
    
     //MARK:- View Setup
   fileprivate func setupView(){
        guard let urlToImage = article.urlToImage else {return}
        let secureImage  = urlToImage.contains("https") ? urlToImage : urlToImage.replacingOccurrences(of: "http", with: "https")
        
        downloadImages(imageURL: secureImage)
        articleTitle.text = article.title
        articleDescription.text = article.description
        articleAuthor.text = article.author
        content.text = article.content
        
        view.addSubview(articleImage)
        articleImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3).isActive = true
        articleImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        articleImage.anchors(top:view.safeAreaLayoutGuide.topAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 0, right: view.rightAnchor, rightPad: 0)
        
        view.addSubview(articleDescription)
        articleDescription.anchors(top: articleImage.bottomAnchor, topPad: 4, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 20, right: view.rightAnchor, rightPad: -20)
        
        view.addSubview(articleTitle)
        articleTitle.anchors(top:articleDescription.bottomAnchor, topPad: 12, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 20, right: view.rightAnchor, rightPad: -20)
        
        view.addSubview(articleAuthor)
        articleAuthor.anchors(top: articleTitle.bottomAnchor, topPad: 12, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 20, right: view.rightAnchor, rightPad: -20)
        
        
        
        //        view.addSubview(content)
        //        content.anchors(top: articleAuthor.bottomAnchor, topPad: 30, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 20, right: view.rightAnchor, rightPad: -20)
    }
    
    func downloadImages(imageURL: String) {
        
        Alamofire.request(imageURL, method: .get)
            .validate()
            .responseData(completionHandler: { (responseData) in
                self.articleImage.image = UIImage(data: responseData.data!)
                DispatchQueue.main.async {
                    // Refresh you views
                }
            })
    }
}
