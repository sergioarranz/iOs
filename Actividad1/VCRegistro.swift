//
//  VCRegistro.swift
//  Actividad1
//
//  Created by developer on 23/3/17.
//  Copyright © 2017 Jorge López Fernández. All rights reserved.
//

import UIKit

class VCRegistro: UIViewController {
    
    @IBOutlet var txtUserR:UITextField?
    @IBOutlet var txtPassR:UITextField?
    @IBOutlet var txtRepPassR:UITextField?
    @IBOutlet var txtEmailR:UITextField?
    
    
    @IBAction func SuccessReg(_ sender: Any) {
        if (txtPassR?.text==txtRepPassR?.text) {
            DataHolder.SHI.sUserR=txtUserR?.text
            DataHolder.SHI.sPassR=txtPassR?.text
            DataHolder.SHI.sEmailR=txtEmailR?.text
            self.performSegue(withIdentifier: "Trans2", sender: self)
        }
    }
    
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

}
