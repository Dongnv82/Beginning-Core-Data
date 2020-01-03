//
//  ScoreViewController.swift
//  Student Management
//
//  Created by MT382 on 1/3/20.
//  Copyright © 2020 DongNV. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var scoreTbl: UITableView!
    
    var arrScore = [Score]()
    var college: College?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        arrScore = DatabaseHelper.shareInstance.getAllScoreData()
        self.scoreTbl.reloadData()
    }

    @IBAction func addScore(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ScoreFormViewController") as! ScoreFormViewController
        vc.college = college
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ScoreViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrScore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreTableViewCell", for: indexPath) as! ScoreTableViewCell
        let data = arrScore[indexPath.row]
        cell.config(data: data)
        return cell
    }
    
}
