//
//  VCPrincipal.swift
//  Actividad1
//
//  Created by Jorge López Fernández on 9/3/17.
//  Copyright © 2017 Jorge López Fernández. All rights reserved.
//

import UIKit

class VCPrincipal: UIViewController {
    
    @IBOutlet var btnNoTocar:UIButton?
    @IBOutlet var lblHolaMundo:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func OnClickAction(){
        lblHolaMundo?.text="El FBI va para tu casa"
        lblHolaMundo?.textColor=UIColor.red
    }
}
