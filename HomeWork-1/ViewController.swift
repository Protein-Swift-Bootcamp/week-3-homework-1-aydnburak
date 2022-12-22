//
//  ViewController.swift
//  HomeWork-1
//
//  Created by Burak on 21.12.2022.
//

import UIKit

extension NSNotification.Name {
    static let addPerson = NSNotification.Name("addPerson");
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var persons:[Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self,selector:#selector(updatePersons(_:)),name: .addPerson,object: nil)
    }
    
    deinit {
     NotificationCenter.default.removeObserver(self, name:.addPerson, object: nil)
    }
    
    
    @objc func updatePersons(_ notification: Notification){
        if let person = notification.userInfo?["person"] as? Person {
            persons.append(person)
            tableView.reloadData()
            }
    }

    

    @IBAction func addButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let goVC = storyboard.instantiateViewController(withIdentifier: "addVC") as! AddViewController
        navigationController?.pushViewController(goVC, animated: true)
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

