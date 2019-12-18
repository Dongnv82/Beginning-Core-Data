//
//  CollegeDetailViewController.swift
//  Student Management
//
//  Created by MT382 on 12/18/19.
//  Copyright © 2019 DongNV. All rights reserved.
//

import UIKit

class CollegeDetailViewController: UIViewController {
    //Mark: IBOutlet
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbClass: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    
    //Mark: -Properties
    var collegeDetail: College?
    var indexRow = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lbName.text = collegeDetail?.name ?? ""
        lbClass.text = collegeDetail?.classRoom ?? ""
        lbAddress.text = collegeDetail?.address ?? ""
        lbEmail.text = collegeDetail?.email ?? ""
        lbPhone.text = collegeDetail?.phone ?? ""
    }

    @IBAction func clickEdit(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        vc.isUpdate = true
        vc.collegeDataUpdate = self.collegeDetail
        vc.indexRow = self.indexRow
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func clickMoreInfo(_ sender: Any) {
    }
    
}
