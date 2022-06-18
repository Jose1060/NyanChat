//
//  RegistroViewController.swift
//  NyanChat
//
//  Created by Mac 01 on 10/06/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegistroViewController: UIViewController {
    
    
    @IBOutlet weak var usuarioTextField: UITextField!
    
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var createButton: UIButton!
    
    
    
    @IBAction func createTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.usuarioTextField.text!, password: self.passTextField.text!, completion: {
            (user, error) in
            print("Intentando crear un usuario")
            if error != nil {
                print("Se presento el siguiente error al crear el usuario: \(String(describing: error))")
            } else {
                print("El usuario fue creado exitosamente!!")
                
                Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                
                let alerta = UIAlertController(title: "Creacion de Usuario", message: "Usuario: \(self.usuarioTextField.text!) se creao correctamente.", preferredStyle: .alert)
                
                let btnOK = UIAlertAction(title: "Aceptar", style: .default, handler: {(UIAlertAction) in self.navigationController?.dismiss(animated: true, completion: nil)})
                
                alerta.addAction(btnOK)
                self.present(alerta, animated: true, completion: nil)
            }
        })
    }
    
    
    override func viewDidLoad() {
        passTextField.autocorrectionType = .no
        
        super.viewDidLoad()

    }

}
