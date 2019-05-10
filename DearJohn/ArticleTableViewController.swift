//
//  ViewController.swift
//  DearJohn
//
//  Created by Lahai on 5/9/19.
//  Copyright © 2019 lolo. All rights reserved.
//

import UIKit
import Alamofire

class ArticleTableViewController: UITableViewController {
    
    //MARK:- Variables
    var article = [Article]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let nav = self.navigationController?.navigationBar
        nav?.prefersLargeTitles = true
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 254/255, green: 80/255, blue: 85/255, alpha: 1.0)]

        self.definesPresentationContext = true
        setupTable()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationItem.title = " "
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "Dear John"
    }
    
    //MARK:- Functions
    fileprivate func setupTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ArticleCell.self, forCellReuseIdentifier: cellId)
        let hero = "johnsingleton"
        let url = "https://newsapi.org/v2/everything?q=\(hero)&sortBy=popularity&apiKey=40fea62006194549b66e85fe34fe413c"
        Alamofire.request(url).responseData { (responseData) in
            if let err = responseData.error {
                print("Failed to contact newsapi", err)
                return
            }
            
            guard let data = responseData.data else {return}
            do {
                let results = try JSONDecoder().decode(News.self, from: data)
                self.article = results.articles
                self.tableView.reloadData()
            } catch let decodeErr {
                print("Failed to decde:", decodeErr)
                
            }
            
        }
    }
    
    //MARK:- Table  Setup
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return article.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ArticleCell
        let article = self.article[indexPath.row]
//        cell.textLabel?.numberOfLines = 0
        let source = article.source?.name ?? ""
        let title = article.title ?? ""
//
//        cell.textLabel?.text =   title + "\n" + source
        cell.articleTitle.text = title
        cell.articleSource.text = source
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticle = self.article[indexPath.row]
        let details = DetailsViewController(article: selectedArticle)
        navigationController?.pushViewController(details, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 124
    }
    
}


