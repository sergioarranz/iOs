//
//  VCRegistro.swift
//  Actividad1
//
//  Created by Sergio Arranz on 23/3/17.
//  Copyright © 2017 Sergio Arranz. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCRegistro: UIViewController {
    
    @IBOutlet var txtfUser:UITextField?
    @IBOutlet var txtfEmail:UITextField?
    @IBOutlet var txtfPass:UITextField?
    @IBOutlet var txtRetypePass:UITextField?
    @IBOutlet var txtAgreement:UISwitch?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func accionBotonRegistrar() {
        
        FIRAuth.auth()?.createUser(withEmail: (txtfEmail?.text)!, password: (txtfPass?.text)!) { (user, error) in
            if(error==nil){
                self.performSegue(withIdentifier: "trregistro", sender: self)
            }
        }
        
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
