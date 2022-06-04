//
//  ViewController.swift
//  NyanChat
//
//  Created by Mac 01 on 27/05/22.
//

import UIKit
import FirebaseAuth

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!){
            (user, error) in
            print("Intentando iniciar sesion")
            if error != nil{
                print("Se presento el siguiente error: \(String(describing: error) )")
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {
                    (user, error) in
                    print("Intentando crear un usuario")
                    if error != nil {
                        print("Se presneto el siguiente error al crear el usuario: \(String(describing: error))")
                    } else {
                        print("El usuario fue creado exitosamente!!")
                        self.performSegue(withIdentifier: "iniciarSesionSegue", sender: nil)
                    }
                })
            }else{
                print("Inicio de sesion exitoso")
                self.performSegue(withIdentifier: "iniciarSesionSegue", sender: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

