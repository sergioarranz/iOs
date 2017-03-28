//
//  VCItem1.swift
//  Actividad1
//
//  Created by Jorge López Fernández on 9/3/17.
//  Copyright © 2017 Jorge López Fernández. All rights reserved.
//

import UIKit

class VCItem1: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var miTabla:UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var Item1Cell:Celda1 = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath) as! Celda1
        
        Item1Cell.lblCelda1?.text="***"
        if(indexPath.row==0){
            Item1Cell.lblCelda1?.text="SERGIO"
        }
        
        if(indexPath.row==1){
            Item1Cell.lblCelda1?.text="JORGE"
        }
        
        if(indexPath.row==2){
            Item1Cell.lblCelda1?.text="QUIROS"
        }
        
        if(indexPath.row==3){
            Item1Cell.lblCelda1?.text="ALEX"
        }
        
        if(indexPath.row==04){
            Item1Cell.lblCelda1?.text="JAIME"
        }
        
        return Item1Cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("HE PINCHADO EN: %d", indexPath.row)
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
