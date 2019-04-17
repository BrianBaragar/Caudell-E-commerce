//
//  File.swift
//  Caudell Market
//
//  Created by Brian Baragar on 4/9/19.
//  Copyright © 2019 Brian Baragar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreData

class API: NSObject{
    ///MARK: - Consulta a API ECCOMMERCE
    var manageObjects:[NSManagedObject] = []
   static func  APIREST(){
    
    let delegado = UIApplication.shared.delegate as! AppDelegate
        
    let url = delegado.urlServicio + "/api/productview/"
        
        ///Producto puede ser obtenido de otra clase para hacer la muestra
        ///Esto como Parte de Escabilidad de la app
    let producto = "F0133000PA"
        
    let peticion = url + producto
        
    let parametros:Parameters = ["logonId":"ZV^M4Y*Wb#%j9tpgZ%Rlvy2TjiyZ", "logonPassword":"ZV^M4Y*Wb#%j9tpgZ%Rlvy2TjiyZ"]
    
    let cookie1 = "WCTrustedToken=751012%2CDE%2BdcqxbaCTOCJPFQu0%2FIUnNoU6%2BBxbZeTbh4ytz8Ps%3D"
    
    let cookie2 = "WCToken=751012%2CHRWYCcAG8fROqJzrAi4dBy4ZLMTDMqKJSKoftTwCNw4iPyA9tb6yyNOTYcg90fQmIY0yFhO9vkJZjCUDh0sIQ%2F5U0Cm4ioevtW%2Fc19A4A5l4I9T3hUj%2BlZaVxjCya0OhqoHg%2FNWngcasYV3BGj%2BskbfT1NItWeMye15v8qHcPm5tb15MgFIVOb9abCxkm%2BNSi%2BJTVNDnDASmYbFpZUK6pfqiDk5cbBSCWBCK%2FuMdf%2FmyrDj3Y%2BZ7A3ImLj%2FDgeaH"
        
    let header:HTTPHeaders = ["Content-Type":"Application/json","Authorization":delegado.token,"Set-Cookie":cookie1,"Set-Cookie":cookie2]
        
    
        
        request(peticion, method: .get, parameters: parametros, encoding: JSONEncoding.default, headers: header).responseJSON { (resultado) in
            switch resultado.result
            {
            case .failure:
                print("Error al conectar JSON")
                break
                
            case .success:
                if resultado.response?.statusCode == 200
                {
                    let json = JSON(resultado.value)
                    print(json)
                }
                else
                {
                    print("ERROR DE CODIGO !200")
                }
                break
                
            }
            }
        
        
    }
    ///MARK: - Pasar Parametros a COREDATA
    func Save(id:String, name:String, precio:String, large:String, short:String, fimage:String)
    {
        let appdelegate = UIApplication.shared.delegate as? AppDelegate
        
        let manage = appdelegate!.persistentContainer.viewContext
        
        let entity =  NSEntityDescription.entity(forEntityName: "Herramienta", in: manage)!
        
        let manageObject =  NSManagedObject(entity: entity, insertInto: manage)
        
        manageObject.setValue(name, forKeyPath: "name")
        manageObject.setValue(id, forKeyPath: "uniqueID")
        manageObject.setValue(large, forKeyPath: "largeD")
        manageObject.setValue(short, forKeyPath: "shortD")
        manageObject.setValue(precio, forKeyPath: "price")
        manageObject.setValue(fimage, forKeyPath: "fullimage")
        
        do {
            try manage.save()
            manageObjects.append(manageObject)
        } catch let error as NSError {
            print("No se pudo agregar a core data error \(error), \(error.userInfo)")
        }
    }
    func load()
    {
        let  appdelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appdelegate!.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Herramienta")
        
        do {
            manageObjects = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("No se puede recuperar los datos\(error). ERROR\(error),\(error.userInfo)")
        }
    }
    
}
