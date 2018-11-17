//
//  PassionViewController.swift
//  Build Us Up
//
//  Created by Kate Roberts on 17/11/2018.
//  Copyright © 2018 Kate Roberts. All rights reserved.
//

import UIKit
import CoreData

class PassionViewController: UIViewController {

    var passion = [0,0,0,0,0,0,0,0,0,0,0,0]
    
    @IBOutlet weak var a: UIButton!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var c: UIButton!
    @IBOutlet weak var d: UIButton!
    @IBOutlet weak var e: UIButton!
    @IBOutlet weak var f: UIButton!
    @IBOutlet weak var g: UIButton!
    @IBOutlet weak var h: UIButton!
    @IBOutlet weak var i: UIButton!
    @IBOutlet weak var j: UIButton!
    @IBOutlet weak var k: UIButton!
    @IBOutlet weak var l: UIButton!
    
    @IBAction func accountManager(_ sender: Any) {
//        if a.state == .normal
//        {
            a.backgroundColor = UIColor.gray
            passion[0] = 1
       // }
    }
    
    @IBAction func b(_ sender: Any) {
        b.backgroundColor = UIColor.gray
        passion[1] = 1
    }
    
    @IBAction func c(_ sender: Any) {
        c.backgroundColor = UIColor.gray
        passion[2] = 1
    }
    
    @IBAction func d(_ sender: Any) {
        d.backgroundColor = UIColor.gray
        passion[3] = 1
    }
    
    @IBAction func e(_ sender: Any) {
        e.backgroundColor = UIColor.gray
        passion[4] = 1
    }
    
    @IBAction func f(_ sender: Any) {
        f.backgroundColor = UIColor.gray
        passion[5] = 1
    }
    
    @IBAction func g(_ sender: Any) {
        g.backgroundColor = UIColor.gray
        passion[6] = 1
    }
    
    @IBAction func h(_ sender: Any) {
        h.backgroundColor = UIColor.gray
        passion[7] = 1
    }
    
    @IBAction func i(_ sender: Any) {
        i.backgroundColor = UIColor.gray
        passion[8] = 1
    }
    
    
    @IBAction func j(_ sender: Any) {
        j.backgroundColor = UIColor.gray
        passion[9] = 1
    }
    
    @IBAction func k(_ sender: Any) {
        k.backgroundColor = UIColor.gray
        passion[10] = 1
    }
    
    @IBAction func l(_ sender: Any) {
        l.backgroundColor = UIColor.gray
        passion[11] = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
