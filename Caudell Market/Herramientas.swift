//
//  File.swift
//  Caudell Market
//
//  Created by Brian Baragar on 4/1/19.
//  Copyright © 2019 Brian Baragar. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON
import CoreData

class  herramientas {
    //MARK- Dummie herramientas API
    /*var id = "13018"
    var name = "Dremel® 3000 – Kit con 10 accesorios"
    var precio = "1089.0"
    var large = "Los mejores productos\nCuerpo Ergonómico\nSoft Grip\nMayor comodidad y control en las operaciones.\nInterruptor de velocidad variable\nPara brindar mayor versatilidad.\nCarbones reemplazables"
    var short = "Voltaje 120 V \nVelocidad de giro en vacío 5,000 – 32,000 rpm \nPeso 0.55 Kg \nPotencia 130 W"
    var fimage = "https://www.boschenlinea.com//wcsstore/boschmx//images/F0133000PA/600x600/F0133000PA-0.png"*/
    ///Campos a pasar a la celda
    var texto = ""
    var imagenes: UIImage!
    
    init(texto:String, imagenes:UIImage!)
    {
        self.texto = texto
        self.imagenes = imagenes
    }
    
    static func description() -> [herramientas]{
        return[
            //Se dejara el metodo dummie para mostrar el carrusel pero los datos son los de el eccomerce
            herramientas(texto: "Dremel® 3000 – Kit con 10 accesorios", imagenes: UIImage(named: "Dremel1")),
            herramientas(texto: "Los mejores productos\nCuerpo Ergonómico\nSoft Grip\nMayor comodidad y control en las operaciones.\nInterruptor de velocidad variable\nPara brindar mayor versatilidad.\nCarbones reemplazables", imagenes: UIImage(named: "Dremel2")),
            herramientas(texto: "Voltaje 120 V \nVelocidad de giro en vacío 5,000 – 32,000 rpm \nPeso 0.55 Kg \nPotencia 130 W", imagenes: UIImage(named: "Dremel3")),
            herramientas(texto: "Precio $1089.0", imagenes: UIImage(named: "Dremel4")),
            herramientas(texto: "13018", imagenes: UIImage(named: "Dremel5"))
        ]
    }
    
}
