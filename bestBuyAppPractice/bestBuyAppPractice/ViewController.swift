//
//  ViewController.swift
//  bestBuyAppPractice
//
//  Created by Tony Cioara on 5/8/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var fetchedItems: Array<FetchedItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func requestItems(seachTerm: String) {
        let network = Networking()
        network.fetchResults(searchTerm: seachTerm) { [weak self] (items) in
            DispatchQueue.main.sync {
                self?.fetchedItems = items
                self?.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func seachButtonPressed(_ sender: Any) {
        guard let seachTerm = self.textField.text else {return}
        requestItems(seachTerm: seachTerm)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell
        cell.configure(fetchedItem: fetchedItems![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedItems?.count ?? 0
    }
    
}

