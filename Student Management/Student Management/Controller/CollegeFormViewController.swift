//
//  CollegeFormViewController.swift
//  Student Management
//
//  Created by MT382 on 12/11/19.
//  Copyright © 2019 DongNV. All rights reserved.
//

import UIKit

class CollegeFormViewController: UIViewController {
    //Mark: -IBOutlet
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textClass: UITextField!
    @IBOutlet weak var textAddress: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPhone: UITextField!
    @IBOutlet weak var status: UIButton!
    
    //Mark: -
    var isUpdate = false
    var indexRow = Int()
    var collegeDataUpdate: College?

    override func viewDidLoad() {
        super.viewDidLoad()
        textName.text = collegeDataUpdate?.name ?? ""
        textClass.text = collegeDataUpdate?.classRoom ?? ""
        textAddress.text = collegeDataUpdate?.address ?? ""
        textEmail.text = collegeDataUpdate?.email ?? ""
        textPhone.text = collegeDataUpdate?.phone ?? ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isUpdate {
            status.setTitle("Update", for: .normal)
        } else {
            status.setTitle("Save", for: .normal)
        }
    }
    
}

extension CollegeFormViewController {
    //Mark: -IBAction
    @IBAction func saveButton(_ sender: UIButton) {
        self.saveCollegeData()
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension CollegeFormViewController {
    //Mark: -Method
    func saveCollegeData() {
        guard let name = textName.text else { return }
        guard let classRoom = textClass.text else { return }
        guard let address = textAddress.text else { return }
        guard let email = textEmail.text else { return }
        guard let phone = textPhone.text else { return }
        
        let collegeDict = [
            "name" : name,
            "classRoom" : classRoom,
            "address" : address,
            "email" : email,
            "phone" : phone
        ]
        if isUpdate {
            DatabaseHelper.shareInstance.updateCollegeData(collegeDict: collegeDict, index: indexRow)
            isUpdate = false
        } else {
            DatabaseHelper.shareInstance.saveColegeData(collegeDict: collegeDict)
        }
        
    }
    
}
