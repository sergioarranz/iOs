//
//  VCMapa.swift
//  Actividad1
//
//  Created by Sergio Arranz on 21/4/17.
//  Copyright © 2017 Sergio Arranz. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase

class VCMapa: UIViewController, MKMapViewDelegate, LocationAdminDelegate {

    @IBOutlet var MiMapa:MKMapView?
    var pines:[String:MKAnnotation]? = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MiMapa?.showsUserLocation = true
        
        DataHolder.SHI.firDataBaseRef.child("Coches").observeSingleEvent(of: .value, with: { (snapshot) in
            let arrTemp=snapshot.value as? Array<AnyObject>
            //if(DataHolder.SHI.arCoches==nil){
            DataHolder.SHI.arCoches=Array<Coche>()
            //}
            
            for co in arrTemp! as [AnyObject]{
                let cochei=Coche(valores: co as! [String:AnyObject])
                DataHolder.SHI.arCoches?.append(cochei)
                
                var coordTemp:CLLocationCoordinate2D = CLLocationCoordinate2D()
                coordTemp.latitude = cochei.dbLat!
                coordTemp.longitude = cochei.dbLon!
                self.agregarPin(coordenada: coordTemp, titulo: cochei.sNombre!)
                
            }
            
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    
    func agregarPin(coordenada:CLLocationCoordinate2D, titulo varTitulo:String){
        var annotation:MKPointAnnotation = MKPointAnnotation()
        
        if(pines?[varTitulo] == nil){
            
        } else{
            annotation = pines?[varTitulo] as! MKPointAnnotation
            MiMapa?.removeAnnotation(annotation)
        }
        
        annotation.coordinate = coordenada
        annotation.title = varTitulo
        
        pines?[varTitulo] = annotation
        MiMapa?.addAnnotation(annotation)
    }
    
    func localizacionActualizada(coordenada:CLLocationCoordinate2D){
        centralizarEnPosicion(coordenada: coordenada)
    }
    
    func centralizarEnPosicion(coordenada:CLLocationCoordinate2D){
        let region:MKCoordinateRegion = MKCoordinateRegion(center:coordenada, span:MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        MiMapa?.setRegion(region, animated: true)
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
