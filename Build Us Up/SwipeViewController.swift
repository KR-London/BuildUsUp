//
//  SwipeViewController.swift
//  Build Us Up
//
//  Created by Kate Roberts on 17/11/2018.
//  Copyright © 2018 Kate Roberts. All rights reserved.
//

import UIKit
import CoreData

class SwipeViewController: UIViewController {

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
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(datafilepath)
        firstUse()
        loadItems()
        
        currentUser = user[0] as! UserProfile
        loadQuestions()
  
        
        questionLabel.text = questions[counter]
        view.backgroundColor = UIColor.yellow
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func saveItems(){
        do{ try context.save() }
        catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            
        }
    }
    
    func loadQuestions(){
        if let contentsOfURL = Bundle.main.url(forResource: "questions", withExtension: "csv") {
            
            // Remove all the menu items before preloading
            if let items = parseCSV(contentsOfURL: contentsOfURL as NSURL, encoding: String.Encoding.utf8) {
                    questions = items
                  }
            }
    }
    
    func parseCSV(contentsOfURL: NSURL, encoding: String.Encoding) -> [String]?
    {
        /// load CSV function
        let delimiter = ","
        var items:[String]?
        
        let optContent = try? String(contentsOf: contentsOfURL as URL!)
        guard let content = optContent
            else
        {
            print("That didn't work!")
            return items
        }
        
        items = []
        
        let lines:[String] = content.components(separatedBy: NSCharacterSet.newlines)
        
        for line in lines{
            var values:[String] = []
            if line != ""
            {
                if line.range( of: "\"" ) != nil
                {
                    var textToScan: String = line
                    var value:NSString?
                    var textScanner:Scanner = Scanner(string: textToScan)
                    while textScanner.string != ""
                    {
                        if (textScanner.string as NSString).substring(to: 1) == "\"" {
                            textScanner.scanLocation += 1
                            textScanner.scanUpTo("\"", into: &value)
                            textScanner.scanLocation += 1
                        } else {
                            textScanner.scanUpTo(delimiter, into: &value)
                        }
                        
                        // Store the value into the values array
                        values.append(value as! String)
                    }
                    
                    // Retrieve the unscanned remainder of the string
                    if textScanner.scanLocation < textScanner.string.count {
                        textToScan = (textScanner.string as NSString).substring(from: textScanner.scanLocation + 1)
                    } else {
                        textToScan = ""
                    }
                    textScanner = Scanner(string: textToScan)
                }
                else  {
                    values = line.components(separatedBy: delimiter)
                }
                
                ///image_file_name: String, name: String, rating: Int
                // Put the values into the tuple and add it to the items array
                let item = (values[1])
                items?.append(item)
            }
        }
        //print(items)
        return items
    }

    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            print("Swipe Right")
           // foodArray[foodArray.index(of: currentlyPicturedFood)!].rating = 1
           // foodImage.image = UIImage(named:"q2.001.jpg")
            currentUser.personality = currentUser.personality ?? "" + "1"
            
            brain()
//            counter = counter + 1
//            questionLabel.text = questions[counter]
//            switch counter
//            {
//            case 0...6:
//                view.backgroundColor = UIColor.yellow
//                questionLabel.text = questions[counter]
//            case 6...12: view.backgroundColor = UIColor.blue
//            case 12...questions.count - 1 : view.backgroundColor = UIColor.green
//            default:view.backgroundColor = UIColor.white
//                questionLabel.text = "No more questions"
//            }
            //updatePicture()
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            print("Swipe Left")
             brain()
            let temp = currentUser.personality ?? ""
            currentUser.personality = temp + "0"
            saveItems()
           // foodArray[foodArray.index(of: currentlyPicturedFood)!].rating = 3
           // foodImage.image = UIImage(named:"q3.001.jpg")
            //updatePicture()
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.up {
            print("Swipe Up")
            //foodArray[foodArray.index(of: currentlyPicturedFood)!].rating = 2
            //updatePicture()
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.down {
            print("Swipe Down")
        }
    }
    
    func brain(){
        counter = counter + 1
       // questionLabel.text = questions[counter]
        switch counter
        {
        case 0...11:
            view.backgroundColor = UIColor.yellow
            questionLabel.text = questions[counter]
        case 11...23: view.backgroundColor = UIColor.blue
        case 12...questions.count - 1 : view.backgroundColor = UIColor.green
        default:view.backgroundColor = UIColor.white
        questionLabel.text = "No more questions"
        }
    }
    
    func firstUse(){
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let user = NSEntityDescription.insertNewObject(forEntityName: "UserProfile", into: managedObjectContext) as! UserProfile
                user.name = "Joy Techlie"
                user.level = 0
                user.technical = ""
                user.personality = ""
                user.passion = ""
                 }
        saveItems()
    }
    
//    func saveItems(){
//        do{ try context.save() }
//        catch{
//            let nserror = error as NSError
//            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//
//        }
//    }

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
