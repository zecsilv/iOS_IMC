//
//  ViewController.swift
//  imc
//
//  Created by José Silva on 06/03/19.
//  Copyright © 2019 JoseSilva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    @IBOutlet weak var lbApresentaIMC: UILabel!
    @IBOutlet weak var ivMostraImg: UIImageView!
    @IBOutlet weak var viResults: UIView!
    
    var imc : Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func btnCalcular(_ sender: Any) {
        if let peso = Double (tfPeso.text!), let altura = Double (tfAltura.text!){
            imc = peso / (altura * altura)
            showResults()
        }
    }
        func showResults(){
            var result = ""
            var image = ""
            
            switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do Peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso Ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
            
            lbApresentaIMC.text = "\(imc) : \(result)"
            ivMostraImg.image = UIImage(named: image)
            viResults.isHidden = false
            view.endEditing(true)
    }
    
}

