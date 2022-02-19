//
//  LoginInteractor.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//

import UIKit
import Firebase

class LoginInteractor:PresenterToInteractorProtocolLogin{
  
    var presenter: InteractorToPresenterProtocolLogin?
    
    func sessionLogin(user: String, password: String) {
        Auth.auth().signIn(withEmail: user, password: password) { [weak self] result, error in
            if let _ = result, error == nil {
                self?.presenter?.loginSucceded(info: "Welcome")
            }else{
                self?.presenter?.loginFailed(info: UIManager.txtLoginError)
            }
            
        }
    }
    
    func sessionLogOut() {
        do {
            try Auth.auth().signOut()
        } catch  {
            fatalError()
        }
    }
    
}

