//
//  ViewController.swift
//  NyanChat
//
//  Created by Mac 01 on 27/05/22.
//

import UIKit
import FirebaseAuth
//import GoogleSignIn
import FirebaseCore
import FirebaseFirestore
import FirebaseDatabase

class iniciarSesionViewController: UIViewController {
    

    
   
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func gitHubTapped(_ sender: Any) {
    }
    
    /*
    @IBAction func googleTapped(_ sender: Any) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
            // ...
            return
          }

          guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: authentication.accessToken)

          // ...
        }
    }*/
    
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!){
            (user, error) in
            print("Intentando iniciar sesion")
            if error != nil{
                print("Se presento el siguiente error: \(String(describing: error) )")
                let alerta = UIAlertController(title: "Usuario no existe", message: "\(String(describing: error))", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Crear Usuario", style: .default, handler: {(UIAlertAction) in self.performSegue(withIdentifier: "registerSegue", sender: nil)})
                
                let btnCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
                alerta.addAction(btnCancelar)
                alerta.addAction(btnOK)
                
                self.present(alerta, animated: true, completion: nil)
            }else{
                print("Inicio de sesion exitoso")
                self.performSegue(withIdentifier: "iniciarSesionSegue", sender: nil)
            }
        }
    }
    
    
    @IBAction func registerTapped(_ sender: Any) {
        performSegue(withIdentifier: "registerSegue", sender: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }
    
   


}



