//
//  PersonalityResultViewController.swift
//  Build Us Up
//
//  Created by Kate Roberts on 17/11/2018.
//  Copyright © 2018 Kate Roberts. All rights reserved.
//

import UIKit
import CoreData

class PersonalityResultViewController: UIViewController {

    @IBOutlet weak var personalityResult: UILabel!
    
    var EI = 0
    var NS = 0
    var TF = 0
    var JP = 0
    
    var currentUser = user[0] as! UserProfile
    var codex = ""

   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var personalityData = currentUser.personality?.dropFirst()
        
        for i in 1...3{
            EI = EI + Int(String(personalityData?.first ?? "0"))!
            personalityData = currentUser.personality?.dropFirst()
        }
        if EI > 0
        {
            codex = codex + "E"
        }
        else
        {
            codex = codex + "I"
        }
        
        for i in 1...3{
            NS = NS + Int(String(personalityData?.first ?? "0"))!
            personalityData = currentUser.personality?.dropFirst()
        }
        if NS > 0
        {
            codex = codex + "N"
        }
        else
        {
            codex = codex + "S"
        }
        
        for i in 1...3{
            TF = TF + Int(String(personalityData?.first ?? "0"))!
            personalityData = currentUser.personality?.dropFirst()
        }
        if TF > 0
        {
            codex = codex + "T"
        }
        else
        {
            codex = codex + "F"
        }
        
        for i in 1...3{
            JP = JP + Int(String(personalityData?.first ?? "0"))!
            personalityData = currentUser.personality?.dropFirst()
        }
        if JP > 0
        {
            codex = codex + "J"
        }
        else
        {
            codex = codex + "P"
        }
        
        print(codex)
        
        var personalityShoutout = ""
        
        switch codex{
            case "INTJ", "INTP", "ENTJ", "ENTP": personalityShoutout = "Analyst"
            case "INFJ", "INFP", "ENFJ", "ENFP": personalityShoutout = "Diplomats"
            case "ISTJ", "ISFJ", "ESTJ", "ESFJ": personalityShoutout = "Sentinels"
            case "ISTP", "ISFP", "ESTP": personalityShoutout = "Explorers"
        default: personalityShoutout = "All rounder"
        }
        
        personalityResult.text = "Your personality type is " + personalityShoutout
        // Do any additional setup after loading the view.
    }
    
}
