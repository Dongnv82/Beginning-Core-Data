//
//  DatabaseHelper.swift
//  Student Management
//
//  Created by MT382 on 12/11/19.
//  Copyright © 2019 DongNV. All rights reserved.
//

import UIKit
import CoreData

class DatabaseHelper: NSObject {
    //Mark: -Properties
    static let shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Mark: -Method College
    func saveColegeData(collegeDict: [String:String]) {
        
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
        college.name = collegeDict["name"]
        college.classRoom = collegeDict["classRoom"]
        college.address = collegeDict["address"]
        college.email = collegeDict["email"]
        college.phone = collegeDict["phone"]
        
        do {
            try context.save()
        }catch let err {
            print("College save error :- \(err.localizedDescription)")
        }
        
    }
    
    func getAllCollegeData() -> [College] {
        var arrCollege = [College]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        
        do {
            arrCollege = try context.fetch(fetchRequest) as! [College]
        }catch let err {
            print("Error in college fetch :- \(err.localizedDescription)")
        }
        
        return arrCollege
    }
    
    func deleteCollegeData(index: Int) -> [College] {
        var arrCollege = self.getAllCollegeData() //get data
        context.delete(arrCollege[index])  // remove form coredata
        arrCollege.remove(at: index)    // remove in array
        do {
            try context.save()
        } catch let err {
            print("delete college data :- \(err.localizedDescription)")
        }
        return arrCollege
    }
    
    func updateCollegeData(collegeDict:[String : String], index: Int) {
        var arrCollege = self.getAllCollegeData()
        arrCollege[index].name = collegeDict["name"]
        arrCollege[index].classRoom = collegeDict["classRoom"]
        arrCollege[index].address = collegeDict["address"]
        arrCollege[index].email = collegeDict["email"]
        arrCollege[index].phone = collegeDict["phone"]
        
        do {
            try context.save()
        }catch let err {
            print("College update error :- \(err.localizedDescription)")
        }
    }
    
    //Mark: -Method Score
    func saveScoreData(scoreDict: [String:String], college: College) {
        
        let score = NSEntityDescription.insertNewObject(forEntityName: "Score", into: context) as! Score
        score.toan = scoreDict["toan"]
        score.ly = scoreDict["ly"]
        score.hoa = scoreDict["hoa"]
        score.anh = scoreDict["anh"]
        score.van = scoreDict["van"]
        score.college = college
        do {
            try context.save()
        }catch let err {
            print("Score save error :- \(err.localizedDescription)")
        }
        
    }
    
    func getAllScoreData() -> [Score] {
        var arrScore = [Score]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Score")
        
        do {
            arrScore = try context.fetch(fetchRequest) as! [Score]
        }catch let err {
            print("Error in score fetch :- \(err.localizedDescription)")
        }
        
        return arrScore
    }
    
    func deleteScoreData(index: Int) -> [Score] {
        var arrScore = self.getAllScoreData() //get data
        context.delete(arrScore[index])  // remove form coredata
        arrScore.remove(at: index)    // remove in array
        do {
            try context.save()
        } catch let err {
            print("delete score data :- \(err.localizedDescription)")
        }
        return arrScore
    }

}
