//
//  ViewController.swift
//  Caudell Market
//
//  Created by Brian Baragar on 3/27/19.
//  Copyright © 2019 Brian Baragar. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    // MARK: -IBOUTLETS
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var CollectionView: UICollectionView!
    
    ///Data Source Collection View
    ///Poner aqui de donde se sacara la informacion para llenar los collection view
    ///sera pasado sin metodo dummie 
    private var herramienta =  herramientas.description()
    
    var manageObjects:[NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Conexion a core data para persistencia de datos
        let  appdelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appdelegate!.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Herramienta")
        
        do {
            manageObjects = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("No se puede recuperar los datos\(error). ERROR\(error),\(error.userInfo)")
        }
    }
    private struct Storyboard {
        
        static let CellIdentifier = "HerramientaCell"
    }
    
    /// Boton Ayuda
    @IBAction func helpUpTappet(_ sender: UIButton) {
        let alert =  UIAlertController(title: "Menu Ayuda",message: "Para moverte en el menu desliza hacia la izquierda para navegar",preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .default)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    ///Boton Menu -Solo es visual es para mostrar que es posible que se maneje a mayor escala
    @IBAction func menuUptappet(_ sender: UIButton) {
        let alert =  UIAlertController(title: "Menu",message: "Aqui se mostrara las demas categorias de herramientas",preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .default)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    ///Boton de compra
    @IBAction func compra(_ sender: UIButton) {
        let alert =  UIAlertController(title: "Carrito de compra",message: "Tranquilo amigo solo es una beta se que esta hermoso pero pronto lo prodras comprar",preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .default)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func pago(_ sender: UIButton){
        
        let image = UIImage(named: "Pay.png")

        let alert =  UIAlertController(title: "Tipos de pago",message: "",preferredStyle: .alert)
        
        let imageAction = UIAlertAction (title: "", style: .default, handler: nil)
        
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .default)
        
        imageAction.setValue(image?.withRenderingMode(.alwaysOriginal), forKey: "image")
        
        alert.addAction(imageAction)
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}
///Mark:-Extension de Homeview para llenado de el ViewCollection

extension HomeViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //CON CORE DATA - FUNCIONA - Solo mostraria un objeto
        //return manageObjects.count
        return herramienta.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! ToolCollectionViewCell
        ///Mostrara los items de la clase herramienta
        ///Dummie Method en pro de mejor vista 
        cell.herramienta = self.herramienta[indexPath.item]
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /*AUTORES DE ICONOS
     ICONO RA
     <div>Icons made by <a href="https://www.flaticon.es/autores/kiranshastry" title="Kiranshastry">Kiranshastry</a> from <a href="https://www.flaticon.es/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
     ICONO COMPRA
     <div>Icons made by <a href="https://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.es/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
     ICONO TIPOS DE PAGO
     <div>Icons made by <a href="https://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.es/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
     */
}


