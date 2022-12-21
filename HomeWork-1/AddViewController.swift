//
//  AddViewController.swift
//  HomeWork-1
//
//  Created by Burak on 21.12.2022.
//

import UIKit

protocol AddViewControllerDelegate {
    func addPerson(person:Person)
}

class AddViewController: UIViewController {
    
    var delegate: AddViewControllerDelegate?

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButton(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let surname = surnameTextField.text ?? ""
        let phone = phoneTextField.text ?? ""
        let person = Person(name: name, surName: surname, phone: phone)
        delegate?.addPerson(person: person)
        navigationController?.popViewController(animated: true)
    }
    
}
