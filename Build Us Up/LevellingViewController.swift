//
//  LevellingViewController.swift
//  Build Us Up
//
//  Created by Kate Roberts on 17/11/2018.
//  Copyright © 2018 Kate Roberts. All rights reserved.
//

import UIKit
import CoreData

class LevellingViewController: UIViewController {

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
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBAction func swipeRight(_ sender: Any) {
        levellingCodex = levellingCodex + "1"
        questionLabel.text = "Have you had this job longer than 5 year?"
        if levellingCodex.count > 1
        {
            performSegue(withIdentifier: "moveToTech", sender: self)
        }
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
         levellingCodex = levellingCodex + "0"
        questionLabel.text = "Have you completed a coding course  (online or in person) "
        if levellingCodex.count > 1
        {
            performSegue(withIdentifier: "moveToTech", sender: self)
        }
    }
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
    
        
    
    }
    
    func saveItems(){
        do{ try context.save() }
        catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            
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
}
