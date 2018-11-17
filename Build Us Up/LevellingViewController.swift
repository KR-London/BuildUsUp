//
//  LevellingViewController.swift
//  Build Us Up
//
//  Created by Kate Roberts on 17/11/2018.
//  Copyright © 2018 Kate Roberts. All rights reserved.
//

import UIKit
import CoreData

//MARK: Define my variables to work with the database
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
var user: [NSManagedObject] = []
var userArray: [UserProfile]!
let datafilepath = FileManager.default.urls(for: .documentDirectory,
                                            in: .userDomainMask).first?.appendingPathComponent("Items.plist")
///MARK: My local variables in my code
var currentUser: UserProfile!
var questions = [String]()
var counter = 0
var levellingCodex = ""

class LevellingViewController: UIViewController {

//    //MARK: Define my variables to work with the database
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    var user: [NSManagedObject] = []
//    var userArray: [UserProfile]!
//    let datafilepath = FileManager.default.urls(for: .documentDirectory,
//                                                in: .userDomainMask).first?.appendingPathComponent("Items.plist")
//    ///MARK: My local variables in my code
//    var currentUser: UserProfile!
//    var questions = [String]()
//    var counter = 0
//    var levellingCodex = ""
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
//    @IBAction func swipeRight(_ sender: Any) {
//        levellingCodex = levellingCodex + "1"
//        questionLabel.text = "Have you had this job longer than 5 year?"
//        if levellingCodex.count > 1
//        {
//            saveLevel()
//            saveItems()
//            performSegue(withIdentifier: "moveToTech", sender: self)
//        }
//    }
//
//    @IBAction func swipeLeft(_ sender: Any) {
//         levellingCodex = levellingCodex + "0"
//        questionLabel.text = "Have you completed a coding course  (online or in person) "
//        if levellingCodex.count > 1
//        {
//            saveLevel()
//            saveItems()
//            performSegue(withIdentifier: "moveToTech", sender: self)
//        }
//    }
    //    @IBAction func swipeRight(_ sender: Any) {
//        levellingCodex = levellingCodex + "1"
//        questionLabel.text = "Have you had this job longer than 5 year?"
//    }
//    
//    @IBAction func swipeLeft(_ sender: Any) {
//        levellingCodex = levellingCodex + "0"
//        questionLabel.text = "Have you completed a coding course  (online or in person) "
//    }
//    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(datafilepath)
        firstUse()
        loadItems()
        
        currentUser = user[0] as! UserProfile
        //loadQuestions()
        
        
        questionLabel.text = "Do you have a job in the technology sector?"
    
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
    
    }
    
    func saveItems(){
        do{ try context.save() }
        catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            
        }
    }
    
    func saveLevel(){
        switch levellingCodex
        {
        case "11":
            currentUser.level = 4
            print("guru")
        case "10": currentUser.level = 3
        print("project leader")
        case "01": currentUser.level = 2
        print("contributor")
        case "00": currentUser.level = 1
        print("beginner")
        default: currentUser.level = 0
        print("fail")
        }
    }
    
    func firstUse(){
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let user = NSEntityDescription.insertNewObject(forEntityName: "UserProfile", into: managedObjectContext) as! UserProfile
            user.name = "Joy Techlie"
            user.level = 0
            user.technical = "X"
            user.personality = "X"
            user.passion = "X"
        }
        saveItems()
    }

    
    func loadItems(){
        let request : NSFetchRequest<UserProfile> = UserProfile.fetchRequest()
        do{
            try
                user = context.fetch(request)
        }
        catch
        {
            print("Error fetching data \(error)")
        }
    }
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        
        // brain(gesture.direction)
        
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            levellingCodex = levellingCodex + "1"
            questionLabel.text = "Have you had this job longer than 5 year?"
            if levellingCodex.count > 1
            {
                saveLevel()
                saveItems()
                performSegue(withIdentifier: "moveToTech", sender: self)
            }
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            levellingCodex = levellingCodex + "0"
            questionLabel.text = "Have you completed a coding course  (online or in person) "
            if levellingCodex.count > 1
            {
                saveLevel()
                saveItems()
                performSegue(withIdentifier: "moveToTech", sender: self)
            }
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.up {
            //brain(answer: "1")
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.down {
           // print("Swipe Down")
        }
    }
}
