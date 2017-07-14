//
//  ViewController.swift
//  test
//
//  Created by Arkadiy Grigoryanc on 25.03.17.
//  Copyright © 2017 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var optionsMenu: CAPSOptionsMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .organize, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = addButton
        
        
        optionsMenu = CAPSOptionsMenu(viewController: self, barButtonItem: addButton, keepBarButtonAtEdge: true)
        
        // optionsMenu = CAPSOptionsMenu(viewController: self, barButtonSystemItem: .Organize, keepBarButtonAtEdge: true)
        
        optionsMenu?.menuActionButtonsHighlightedColor(UIColor(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1.0))
        optionsMenu?.menuCornerRadius(2.0)
        
        let menuAction1: CAPSOptionsMenuAction = CAPSOptionsMenuAction(title: "Action Title 1") { (action: CAPSOptionsMenuAction) -> Void in
            print("Tapped Action Button 1")
        }
        
        menuAction1.image = UIImage(named: "ic_audio_24x24")
        
        optionsMenu?.addAction(menuAction1)
        
        let menuAction2: CAPSOptionsMenuAction = CAPSOptionsMenuAction(title: "Action Title 2") { (action: CAPSOptionsMenuAction) -> Void in
            print("Tapped Action Button 2")
        }
        optionsMenu?.addAction(menuAction2)
        
        let menuAction3: CAPSOptionsMenuAction = CAPSOptionsMenuAction(title: "Action Title 3") { (action: CAPSOptionsMenuAction) -> Void in
            print("Tapped Action Button 3")
        }
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        optionsMenu?.addAction(menuAction3)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

