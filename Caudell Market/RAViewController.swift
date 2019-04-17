//
//  RAViewController.swift
//  Caudell Market
//
//  Created by Brian Baragar on 3/27/19.
//  Copyright © 2019 Brian Baragar. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class RAViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Conjunto de vistas del Delegate
        sceneView.delegate = self
        
        // Mostrar Estadisticas y fps SOLO PARA PRUEBAS DE MEMORIA 
        sceneView.showsStatistics = false
        
        //Objeto herramienta
        //let scene = SCNScene(named: "art.scnassets/Herramienta2.scn")!
        
        //Depuracion "Puntos de la scena"
        //sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        
        // Conjunto de la escena en la vista y muestra 
        ///sceneView.scene = scene
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*Agregar en donde se toca la pantalla el objeto en realidad aumentada
         Errores por el pase de parametros

         let inicial =  touches.first
        
        let pointi = sceneView.hitTest(inicial!.location(in: sceneView), types: [ARHitTestResult.ResultType.featurePoint])
        
        let pointf = pointi.last
        
        let final = pointf!.worldTransform
        
        ///Puntero en X,Y,Z
        let pointAR = SCNVector3(
            final[3][0],
            final[3][1],
            final[3][2])*/
        ///Se Agrega el Objeto pero no se mantiene en los puntos que se le dio en un inicio
        ///Es posible que sea de las propiedades nativas del Objeto el Error
        Addtool()
    }
    
    func Addtool(){
        
        let scene = SCNScene(named: "art.scnassets/Herramienta2.scn")!
        
        sceneView.scene = scene
        
        print("El objeto de Realidad aumentada se añadido al mundo Real")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Crear una sesion en la configuracion de mapeo
        let configuration = ARWorldTrackingConfiguration()
        
        ///Se utiliza el atributo para detectar el plano en forma horizontal
        configuration.planeDetection = .horizontal
        
        // Correr las vistas de sesion
        sceneView.session.run(configuration)
        print("Se abrio la realidad aumentada")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //Pausar las vistas de la sesion
        sceneView.session.pause()
        print("Se cerro la realidad aumentada")
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Muestra un mensaje de error
        print ("Error en la realidad aumentada")
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Informa sobre la sesion
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        //Resetea el rastreo o el movimiento existente si es requerido
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
