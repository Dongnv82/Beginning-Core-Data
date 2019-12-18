//
//  ViewController.swift
//  Student Management
//
//  Created by MT382 on 12/11/19.
//  Copyright © 2019 DongNV. All rights reserved.
//

import UIKit

class CollegeListViewController: UIViewController {
    //Mark: -IBOutlet
    
    @IBOutlet weak var collegeTableView: UITableView!
    
    //Mark: -Properties
    var arrCollege = [College]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arrCollege = DatabaseHelper.shareInstance.getAllCollegeData()
        collegeTableView.estimatedRowHeight = 100
        collegeTableView.rowHeight = UITableView.automaticDimension
        collegeTableView.separatorStyle = .none
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.arrCollege = DatabaseHelper.shareInstance.getAllCollegeData()
        collegeTableView.reloadData()
    }
    
}

extension CollegeListViewController {
    //Mark: -IBAction
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension CollegeListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCollege.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeViewCell", for: indexPath) as! CollegeViewCell
        let data = arrCollege[indexPath.row]
        cell.config(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CollegeDetailViewController") as! CollegeDetailViewController
        vc.collegeDetail = arrCollege[indexPath.row]
        vc.indexRow = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrCollege = DatabaseHelper.shareInstance.deleteCollegeData(index: indexPath.row)
            self.collegeTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

