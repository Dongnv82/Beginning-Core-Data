//
//  ScoreFormViewController.swift
//  Student Management
//
//  Created by MT382 on 1/3/20.
//  Copyright © 2020 DongNV. All rights reserved.
//

import UIKit

class ScoreFormViewController: UIViewController {
    
    @IBOutlet weak var textToan: UITextField!
    @IBOutlet weak var textLy: UITextField!
    @IBOutlet weak var textHoa: UITextField!
    @IBOutlet weak var textAnh: UITextField!
    @IBOutlet weak var textVan: UITextField!
    @IBOutlet weak var status: UIButton!
    
    var college: College?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func saveScore(_ sender: Any) {
        self.saveScoreData()
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ScoreFormViewController {
    
    func saveScoreData() {
        guard let toan = textToan.text, let ly = textLy.text, let hoa = textHoa.text, let anh = textAnh.text, let van = textVan.text, let mainCollege = college else {return}
        let scoreDict = [
            "toan" : toan,
            "ly" : ly,
            "hoa" : hoa,
            "anh" : anh,
            "van" : van
        ]
        DatabaseHelper.shareInstance.saveScoreData(scoreDict: scoreDict, college: mainCollege)
    }
    
}
