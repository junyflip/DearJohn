//
//  ArticleCell.swift
//  DearJohn
//
//  Created by Lahai on 5/9/19.
//  Copyright © 2019 lolo. All rights reserved.
//

import UIKit
class ArticleCell: UITableViewCell {
    
    //MARK:- Variables
    let cellView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let articleTitle: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let articleSource: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.textColor = UIColor(red: 254/255, green: 80/255, blue: 85/255, alpha: 1.0)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let articleImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    

    //MARK:- Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     //MARK:- Setup
    func setup(){
        addSubview(cellView)
        cellView.addSubview(articleTitle)
        cellView.addSubview(articleSource)


        cellView.anchors(top: topAnchor, topPad: 0, bottom: bottomAnchor, bottomPad: 0, left: leftAnchor, leftPad: 20, right: rightAnchor, rightPad: -20)
        
        articleTitle.anchors(top: cellView.topAnchor, topPad: 12, bottom: nil, bottomPad: 0, left: cellView.leftAnchor, leftPad: 20, right: cellView.rightAnchor, rightPad: -20)
        
        articleSource.anchors(top: articleTitle.bottomAnchor, topPad: 4, bottom: nil, bottomPad: 0, left: cellView.leftAnchor, leftPad: 20, right: nil, rightPad: -20)
        
    }
}
