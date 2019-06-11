//
//  NewsTableViewCell.swift
//  StretchMyHead
//
//  Created by Dayson Dong on 2019-06-11.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    
    var newsItem: NewsItem? {
        
        didSet{
            if let item = newsItem {
                categoryLabel.text = item.category.rawValue
                categoryLabel.textColor = item.categoryColor
                headlineLabel.text = item.headline
            } else {
                
                categoryLabel.text = nil
                headlineLabel.text = nil
                
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
