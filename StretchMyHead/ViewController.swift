//
//  ViewController.swift
//  StretchMyHead
//
//  Created by Dayson Dong on 2019-06-11.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    var headerView: UIView!
    
    private var categoryInfo: (String, UIColor)!
    private var allNews: [NewsItem] = []
    private var topConstraint: NSLayoutConstraint!
    private var widthConstraint: NSLayoutConstraint!
    private var heightConstraint: NSLayoutConstraint!
    private let kTableHeaderHeight: CGFloat = 257.0
    private let kTableHeaderCutAway: CGFloat = 30.0
    var headerMaskLayer: CAShapeLayer!

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        headerView = tableView.tableHeaderView
        setDateLbel()
        setHeaderView()
        setMaskLayer()
        makeNews()
        updateHeaderView()
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: DATA
    func makeNews() {
        
        let news1 = NewsItem(category: .World, headline: "Climate change protests, divestments meet fossil fuels realities")
        let news2 = NewsItem(category: .Europe, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'")
        let news3 = NewsItem(category: .MiddleEast, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
        let news4 = NewsItem(category: .Africa, headline:  "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")
        let news5 = NewsItem(category: .AsiaPacific, headline: "Despite UN ruling, Japan seeks backing for whale hunting")
        let news6 = NewsItem(category: .Americas, headline:  "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
        let news7 = NewsItem(category: .World, headline: "South Africa in $40 billion deal for Russian nuclear reactors")
        let news8 = NewsItem(category: .Europe, headline: "'One million babies' created by EU student exchanges")
        allNews += [news1, news2,news3,news4,news5,news6,news7,news8,news1, news2,news3,news4,news5,news6,news7,news8]
    }
    
    //MARK: PRIVATE
    
    private func setDateLbel() {
        
        let date = Date.init()
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "LLLL dd"
        let dateString = dateFormatter.string(from: date)
        dateLabel.text = dateString
        
    }
    
    func setMaskLayer() {
        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.black.cgColor
        headerView.layer.mask = headerMaskLayer
        
        
    }
    

    
    private func setHeaderView() {
        
//        let effectiveHeight: CGFloat = kTableHeaderHeight - kTableHeaderCutAway/2
        tableView.tableHeaderView = nil
        headerView.translatesAutoresizingMaskIntoConstraints = false
        

        tableView.addSubview(headerView)

//        headerView.translatesAutoresizingMaskIntoConstraints = true
        topConstraint = headerView.topAnchor.constraint(equalTo: self.view.topAnchor)
        widthConstraint = headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        heightConstraint = headerView.heightAnchor.constraint(equalToConstant: kTableHeaderHeight)
        NSLayoutConstraint.activate([
            topConstraint,
            widthConstraint,
            heightConstraint,
            headerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            ])
        
        tableView.contentInset.top =  kTableHeaderHeight
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
    
    }
    
    private func updateHeaderView() {
        
        let offset = tableView.contentOffset
        let yTransition = offset.y + kTableHeaderHeight
//        let effectiveHeight: CGFloat = kTableHeaderHeight - kTableHeaderCutAway/2
//        var headRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
//        headerView.frame = headRect
        if offset.y < -kTableHeaderHeight {
            widthConstraint.constant = 0
            heightConstraint.constant = kTableHeaderHeight
            heightConstraint.constant = kTableHeaderHeight - yTransition
            widthConstraint.constant -= yTransition

        } else {
            topConstraint.constant = 0
            topConstraint.constant -= yTransition
        }

        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: headerView.frame.width, y: 0))
        path.addLine(to: CGPoint(x: headerView.frame.width, y: headerView.frame.height))
        path.addLine(to: CGPoint(x: 0, y: headerView.frame.height - kTableHeaderCutAway))
        headerMaskLayer?.path = path.cgPath
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    

}

//MARK: TableView Delegate and DataSource

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return allNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        
        cell.newsItem = allNews[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    

    
    
    
    
    
}

