//
//  TeamViewController.swift
//  GroupProposal2
//
//  Created by Settimi, Niccolo B. on 4/7/26.
//

import UIKit

class TeamViewController: UIViewController {

    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var memberDescription: UILabel!
    @IBOutlet weak var memberImage: UIImageView!
    
    var teamInfo: TabInfo?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let teamInfo = teamInfo else { return }
        
        memberName.text = teamInfo.title
        memberDescription.text = teamInfo.description
        memberImage.image = teamInfo.image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
