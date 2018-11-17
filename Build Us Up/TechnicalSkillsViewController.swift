//
//  TechnicalSkillsViewController.swift
//  Build Us Up
//
//  Created by Kate Roberts on 17/11/2018.
//  Copyright © 2018 Kate Roberts. All rights reserved.
//

import UIKit
import CoreData

//MARK: Define my variables to work with the database
//let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//var user: [NSManagedObject] = []
//var userArray: [UserProfile]!
//let datafilepath = FileManager.default.urls(for: .documentDirectory,
//                                            in: .userDomainMask).first?.appendingPathComponent("Items.plist")
/////MARK: My local variables in my code
//var currentUser: UserProfile!
//var questions = [String]()
//var counter = 0



class TechnicalSkillsViewController: UIViewController {

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
//
    var  counter = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(datafilepath)
        //firstUse()
        //loadItems()
        
       // currentUser = user[0] as! UserProfile
        loadQuestions()
        
        
        questionLabel.text = questions[counter]
        
        questionLabel.textColor = UIColor(hexString: "#EA8A8A")
        view.backgroundColor = UIColor(hexString: "f2f2f2")
        
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
        if let contentsOfURL = Bundle.main.url(forResource: "technicalquestions", withExtension: "csv") {
            
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
        
        // brain(gesture.direction)
        
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            brain(answer: "2")
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            brain(answer: "0")
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.up {
            brain(answer: "1")
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.down {
            print("Swipe Down")
        }
    }
    
    func brain(answer: String){
        counter = counter + 1
        // questionLabel.text = questions[counter]
        switch counter
        {
        case 0...11:
            //view.backgroundColor = UIColor.yellow
            questionLabel.text = questions[counter]
            currentUser.personality = currentUser.personality! + answer
        //currentUser.personality = answer
        //case 11...23: view.backgroundColor = UIColor.blue
        //case 12...questions.count - 1 : view.backgroundColor = UIColor.green
        default: performSegue(withIdentifier: "segueToPersonality", sender: self)
        }
        saveItems()
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
    
    //  let mainStoryBoard = UIStoryboard(name: "swipe", bundle: Bundle.main)
    //
    //    guard let destinationVC = mainStoryBoard.instantiateViewController(withIdentifier: "techBoost") as? UIViewController
    //                    else
    //                    {
    //                        print("Couldn't find view controller")
    //                        return
    //                    }
    //
    //       navigationController?.pushViewController(destinationVC, animated: true)
    //
    //    onButtonTapped()
    //     performSegue(withIdentifier: goToData, sender: self)
    //     }

}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}
