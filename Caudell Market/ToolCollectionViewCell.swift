//
//  ToolCollectionViewCell.swift
//  Caudell Market
//
//  Created by Brian Baragar on 4/8/19.
//  Copyright © 2019 Brian Baragar. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
import SwiftyJSON

class ToolCollectionViewCell: UICollectionViewCell {
    ///MARK: - Herramientas
    var herramienta: herramientas! {
        didSet{
            updateUI()
        }
    }
    ///MARK: -Private
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var HerramientaNameLabel: UILabel!
    
    private func updateUI() {
         HerramientaNameLabel?.text = herramienta.texto
         imagen?.image! = herramienta.imagenes
    }

    
    
}
