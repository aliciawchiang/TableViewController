//
//  CustomCell.swift
//  TableViewController
//
//  Created by mark me on 1/9/20.
//  Copyright © 2020 mark me. All rights reserved.
//

import Foundation
import UIKit

struct CellData {
    var title: String!
    var image: String!
    init(title: String = "", image: String = "") {
        self.title = title
        self.image = image
    }
}

class CustomCell: UITableViewCell {
    @IBOutlet var picImage: UIImageView!
    @IBOutlet var label: UILabel!
    
    func configCell(data: CellData) {
        self.label.text = data.title
        self.picImage.image = UIImage(named: data.image)
    }
}
