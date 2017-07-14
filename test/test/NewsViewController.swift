//
//  NewsViewController.swift
//  test
//
//  Created by Arkadiy Grigoryanc on 12.07.17.
//  Copyright © 2017 Olya Danylova. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController {
    
    private let serverManager = ServerManager.manager
    
    private var news: [News]? {
        
        didSet {
            
            if let news = news, !news.isEmpty {
                
                tableView.reloadData()
                
            } else {
                
                let alertController = UIAlertController(title: "", message: "No news", preferredStyle: .alert)
                
                self.present(alertController, animated: true) {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        
                        alertController.dismiss(animated: true, completion: nil)
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Масштабирование
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // fetch news
        fetchNews()
        
    }
    
    func fetchNews() {
        
        serverManager.fetchNews(success: { news in
            
            self.news = news
            
        }) { fault in
            
            let alertController = UIAlertController(title: "Error", message: "Sory. An error occurred, try to update.", preferredStyle: .alert)
            
            let cancalAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alertController.addAction(cancalAction)
            
            self.present(alertController, animated: true) {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    
                    alertController.dismiss(animated: true, completion: nil)
                    
                }
                
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return news?.count ?? 0
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewCell", for: indexPath) as! NewTableViewCell

        // Configure the cell...
        
        let new = news![indexPath.row]
        
        cell.label.text = new.header
        
        cell.accessoryType = new.isRead ? .checkmark : .none

        return cell
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowNew" {
            
            let vc = segue.destination as! NewViewController
            
            let cell = sender as! UITableViewCell
            
            if let indexPath = tableView.indexPath(for: cell) {
                
                // Set "new" to NewViewController
                vc.new = news![indexPath.row]
                
            }
            
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func actionUnwindToNews(_ segue: UIStoryboardSegue) {
        
        if segue.identifier == "UnwindToNews" {
            
            let vc = segue.source as! NewViewController
            
            guard let index = news?.index(where: { $0.objectId == vc.new.objectId }) else { return }
            
            news![index] = vc.new
            
            let indexPath = IndexPath(row: index, section: 0)
            
            tableView.reloadRows(at: [indexPath], with: .fade)
            
        }
        
    }
    
    
    
}













