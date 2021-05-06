//
//  Cell.swift
//  SkeletonSample
//
//  Created by moonkyoochoi on 2021/05/04.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        self.isSkeletonable = true
        label.isSkeletonable = true
    }
}
