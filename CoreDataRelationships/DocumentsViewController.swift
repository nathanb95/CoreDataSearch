//
//  DocumentsViewController.swift
//  CoreDataRelationships
//
//  Created by Nathaniel Banderas on 7/13/18.
//  Copyright © 2018 Nathaniel Banderas. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class DocumentsViewController: UIViewController {

    @IBOutlet weak var documentsTableView: UITableView!
    
    let dateFormatter = DateFormatter()
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.documentsTableView.reloadData()
    }
    
    @IBAction func addDocument(_ sender: Any) {
        performSegue(withIdentifier: "showDocument", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? NewDocumentViewController else {
            return
        }
        
        destination.category = category
    }
    
    func deleteDocument(at indexPath: IndexPath) {
        guard let document = category?.documents?[indexPath.row], let managedContext = document.managedObjectContext else {
            return
        }
        
        managedContext.delete(document)
        
        do {
            try managedContext.save()
            
            documentsTableView.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print("Could not delete document")
            
            documentsTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}

extension DocumentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.documents?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = documentsTableView.dequeueReusableCell(withIdentifier: "documentCell", for: indexPath) as! documentTableViewCell
        if let document = category?.documents?[indexPath.row] {
            cell.titleLabel?.text = document.name
            cell.sizeLabel?.text = String(document.size)
            
            if let date = document.date {
                cell.dateLabel?.text = dateFormatter.string(from: date)
            }
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteDocument(at: indexPath)
        }
    }
}

extension DocumentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDocument", sender: self)
    }
}

class documentTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
}


