//
//  InfoViewController.swift
//  GroupProposal2
//
//  Created by Boston, Samuel T. on 4/6/26.
//

import UIKit

class InfoViewController: UIViewController {

    var projectDetail: TabInfo?
    
    @IBOutlet weak var projectTitle: UILabel!
    @IBOutlet weak var projectDescription: UILabel!
    @IBOutlet weak var projectImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let projectDetail = projectDetail else { return }
        
        projectTitle.text = projectDetail.title
        projectDescription.text = projectDetail.description
        projectImage.image = projectDetail.image
    }
    

    /*
     
     
    1) Animations
    2) Table Views
    3) Classes
    4) Extensions
    5) Safe Wrapping
    6) Protocols
    7) Closures
    8) Sending data through pages
    9) Alerts
        On our own
    10) Grids
    11) Adding UIs to table view
    */

}
