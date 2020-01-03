//
//  ScoreTableViewCell.swift
//  Student Management
//
//  Created by MT382 on 1/3/20.
//  Copyright © 2020 DongNV. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblToan: UILabel!
    @IBOutlet weak var lbLy: UILabel!
    @IBOutlet weak var lbHoa: UILabel!
    @IBOutlet weak var lbAnh: UILabel!
    @IBOutlet weak var lbVan: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(data: Score) {
        lblToan.text = data.toan
        lbLy.text = data.ly
        lbHoa.text = data.hoa
        lbAnh.text = data.van
        lbVan.text = data.anh
    }

}
