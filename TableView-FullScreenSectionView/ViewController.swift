//
//  ViewController.swift
//  TableView-FullScreenSectionView
//
//  Created by Veliyan Georgiev on 2/27/17.
//  Copyright © 2017 VillyG. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    convenience init() {
        
        self.init(style: UITableViewStyle.grouped)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Gun details"
        
    }


    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        //        print("will execute before rotation")
        
        self.tableView.beginUpdates()
        
        coordinator.animate(alongsideTransition: { (context: UIViewControllerTransitionCoordinatorContext) in
            
            //            print("will execute during rotation")
            
            self.tableView.endUpdates()
            
        }) { (context: UIViewControllerTransitionCoordinatorContext) in
            
            //            print("will execute after rotation")
            
        }
        
    }
    
    
    // ***********************************************
    // MARK: - UITableViewDataSource
    // ***********************************************
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // since it is a static view we don't care about recycling at this time
        let result: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        
        result.textLabel?.text = "Text for row at: \(indexPath.row)"
        result.detailTextLabel?.text = "Details for row at: \(indexPath.row)"
        
        return result
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            let orientation = UIApplication.shared.statusBarOrientation
            
            if orientation.isLandscape {
                return view.frame.height
            } else {
                return view.frame.height / 3
            }
        }
        
        return UITableViewAutomaticDimension
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
        // We'll assume that there is only one section for now.
        
        if section == 0 {
            
            let imageView: UIImageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.image =  UIImage(named: "gun")!
            return imageView
        }
        
        return nil
        
    }

    
}

