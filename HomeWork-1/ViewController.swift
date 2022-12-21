//
//  ViewController.swift
//  HomeWork-1
//
//  Created by Burak on 21.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var addViewController: AddViewController?
    
    var persons:[Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func addButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let goVC = storyboard.instantiateViewController(withIdentifier: "addVC") as! AddViewController
        goVC.delegate = self
        navigationController?.pushViewController(goVC, animated: true)
    }
}

extension ViewController: AddViewControllerDelegate{
    func addPerson(person: Person) {
        persons.append(person)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = persons[indexPath.row]
        cell.textLabel?.text = "\(person.name)-\(person.surName)-\(person.phone)"
        return cell
    }
    
    
}

