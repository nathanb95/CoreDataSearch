//
//  NewDocumentViewContoller.swift
//  CoreDataRelationships
//
//  Created by Nathaniel Banderas on 7/13/18.
//  Copyright © 2018 Nathaniel Banderas. All rights reserved.
//

import UIKit

class NewDocumentViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        bodyTextView.delegate = self as! UITextViewDelegate
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        bodyTextView.resignFirstResponder()
    }
    
    @IBAction func saveDocument(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let body = bodyTextView.text ?? ""
        let date = Date()
        let size = Int64(0)
        
        if let document = Document(name: name, body: body, date: date, size: size) {
            category?.addToRawDocuments(document)
            
            do {
                try document.managedObjectContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Could not save")
            }
        }
    }
}

extension NewDocumentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
