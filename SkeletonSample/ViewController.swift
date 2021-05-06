//
//  ViewController.swift
//  SkeletonSample
//
//  Created by moonkyoochoi on 2021/05/04.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {
    
    var items: [String] = []
    
    lazy var tableView: UITableView = {
       
        let tbv = UITableView(frame: .zero)
        
        self.view.addSubview(tbv)
        
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tbv.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tbv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tbv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        tbv.rowHeight = UITableView.automaticDimension
        tbv.estimatedRowHeight = 30
        
        tbv.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        
        return tbv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        self.tableView.isSkeletonable = true
        
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight, duration: 0.5, autoreverses: true)
        
        self.tableView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .lightGray), animation: animation, transition: .crossDissolve(0.5))
        self.tableView.showSkeleton(usingColor: .red)
        
        //self.tableView.showSkeleton(usingColor: .blue, transition: SkeletonTransitionStyle.crossDissolve(0.5))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            for i in 0 ..< 100 {
                self.items.append("\(i)")
            }
            
            self.tableView.stopSkeletonAnimation()
            self.tableView.hideSkeleton(reloadDataAfter: true)
        }
        
        
    }
}

extension ViewController: SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "Cell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? Cell else {
           fatalError()
        }
        cell.label.text = self.items[indexPath.row]

        return cell
    }
    
    
}

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 100
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? Cell else {
//            fatalError()
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            cell.label.text = "\(indexPath.row)"
//        }
//
//        return cell
//    }
//}
//
