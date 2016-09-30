//
//  ViewController.swift
//  ImageFromURL
//
//  Created by saul ulises urias guzmàn on 29/09/16.
//  Copyright © 2016 saul ulises urias guzmàn. All rights reserved.
//

/**
 *Este programa esta hecho con la finalidad de buscar la mejor forma de cargar una imagen desde una URL
 */
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Mandamos a llamar el metodo que carga la imagen de manera lenta
        self.slow()
        
        
        //Mandamos llamar el metodo que carga la imagen de manera rapida
        self.fast()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Metodo para cargar imagenes de manera lenta
    func slow(){
        //Variable para saber cuando inicio el metodo
        let methodStart = Date()

        //URL de la cual se va a descargar la imagen
        let url = URL(string: "https://s3-us-west-1.amazonaws.com/powr/defaults/image-slider2.jpg")
        
        do {
            
            let data = try Data(contentsOf: url!)
            self.backgroundImage.image = UIImage(data: data)
            
        } catch {
            
            print("error")
        
        }
        
        //Variable para saber cuando se termino el metodo
        let methodFinish = Date()
        
        
        //Variable que calcula el tiempo que duro ejecutandose el metodo
        let executionTime = methodFinish.timeIntervalSince(methodStart)
        //Se imprime el tiempo que duro la ejecución del metodo
        print("Tiempo de ejecución: \(executionTime)")
        
    }
    
    //Metodo para cargar imagenes de manera rápida
    func fast(){
        
        DispatchQueue.global(qos: .background).async {
            //Variable para saber cuando inicio el metodo
            let methodStart = Date()
            //URL de la cual se va a descargar la imagen
            let url = URL(string: "https://s3-us-west-1.amazonaws.com/powr/defaults/image-slider2.jpg")
            
            do {
                
                let data = try Data(contentsOf: url!)
                
                DispatchQueue.main.async {
                    //Asignamos la imagen a nuestro background
                    self.backgroundImage.image = UIImage(data: data)
                    
                    //Variable para saber cuando se termino el metodo
                    let methodFinish = Date()
                    
                    
                    //Variable que calcula el tiempo que duro ejecutandose el metodo
                    let executionTime = methodFinish.timeIntervalSince(methodStart)
                    //Se imprime el tiempo que duro la ejecución del metodo
                    print("Tiempo de ejecución: \(executionTime)")
                }
                
            } catch {
                
                print("error")
                
            }
            
            
        }

    }

}

