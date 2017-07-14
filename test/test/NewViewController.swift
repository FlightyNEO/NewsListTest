//
//  NewViewController.swift
//  test
//
//  Created by Arkadiy Grigoryanc on 14.07.17.
//  Copyright © 2017 Olya Danylova. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    var new: News!
    
    @IBOutlet private weak var textView: UITextView! {
        
        didSet {
            
            // Set text
            if let text = new.text {
                
                textView.text = text
                
            }
            
        }
        
    }
    
    private enum ButtonType: String {
        
        case wasRead = "Was read"
        
        case markAsRead = "Mark as read"
        
        static func isRead(_ flag: Bool) -> String {
            
            let type: ButtonType = flag ? .wasRead : .markAsRead
            
            return type.rawValue
            
        }
        
    }
    
    @IBOutlet weak var readButton: UIButton! {
        
        didSet {
            
            // Set tittle for button
            
            readButton.setTitle(ButtonType.isRead(new.isRead), for: .normal)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set header
        navigationItem.title = new.header
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    private let serverManager = ServerManager.manager
    
    @IBAction func actionRead(_ sender: UIButton) {
        
        guard !new.isRead else { return }
        
        serverManager.readNew(new, success: {
            
            sender.setTitle(ButtonType.isRead(true), for: .normal)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                
                self?.performSegue(withIdentifier: "UnwindToNews", sender: nil)
                
            }
            
        }) { fault in
            
            let alertController = UIAlertController(title: "Error", message: "Sory. An error occurred, please try again later.", preferredStyle: .alert)
            
            let cancalAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alertController.addAction(cancalAction)
            
            self.present(alertController, animated: true) {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    
                    alertController.dismiss(animated: true, completion: nil)
                    
                }
                
            }
            
        }
        
    }
    
    
    
    
    

}







