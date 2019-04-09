//
//  HerramientasCollectionViewCell.swift
//  Caudell Market
//
//  Created by Brian Baragar on 4/4/19.
//  Copyright © 2019 Brian Baragar. All rights reserved.
//

import UIKit

class  HerramientasViewControllerCell : UICollectionViewCell {
    ///MARK: - Public API
    var herramienta: herramientas! {
        didSet{
            updateUI()
        }
    }
    ///MARK: -Private
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var HerramientaNameLabel: UILabel!
    private func updateUI() {
        HerramientaNameLabel?.text = herramienta.nombre
        imagen?.image! = herramienta.imagenes
    }
}

