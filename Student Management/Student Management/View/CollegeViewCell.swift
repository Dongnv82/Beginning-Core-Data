//
//  CollegeViewCell.swift
//  Student Management
//
//  Created by MT382 on 12/11/19.
//  Copyright © 2019 DongNV. All rights reserved.
//

import UIKit

class CollegeViewCell: UITableViewCell {
    //Mark: -IBOutlet
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbClass: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    
    //Mark: -Properties
//    var arrCollege = [College]()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    //Mark: -Method
    func config(data: College) {
        lbName.text = data.name
        lbClass.text = data.classRoom
        lbAddress.text = data.address
        lbEmail.text = data.email
        lbPhone.text = data.phone
    }

}
