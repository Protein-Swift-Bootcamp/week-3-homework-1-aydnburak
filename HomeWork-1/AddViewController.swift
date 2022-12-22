//
//  AddViewController.swift
//  HomeWork-1
//
//  Created by Burak on 21.12.2022.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("Clear AddViewController")
    }
    
    @IBAction func addButton(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let surname = surnameTextField.text ?? ""
        let phone = phoneTextField.text ?? ""
        let person = Person(name: name, surName: surname, phone: phone)
        let userInfo:[String: Person] = ["person": person]
        
        NotificationCenter.default.post(name:.addPerson,object: nil,userInfo: userInfo)
        
        navigationController?.popViewController(animated: true)
    }
    
}
