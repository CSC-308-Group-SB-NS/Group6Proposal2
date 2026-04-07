//
//  ViewController.swift
//  GroupProposal2
//
//  Created by Settimi, Niccolo B. on 4/6/26.
//

import UIKit

class IndexViewController: UIViewController {
    let sectionTitles = ["Project", "Team", "Example"]
    
    let projectNames = ["Frontend", "Backend", "UI"]
    let teamNames = ["Nicco Settimi", "Sam Boston"]
}

extension IndexViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 - section
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section >= sectionTitles.count)
        {
            return nil
        }
        
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        var labelName: String
        
        switch (indexPath.section)
        {
        case 0:
            labelName = projectNames[indexPath.row]
        case 1:
            labelName = teamNames[indexPath.row]
        default:
            labelName = "UI Example"
            cell.imageView?.image = UIImage(systemName: "square.and.arrow.up")
        }
        
        cell.textLabel?.text = "\(labelName)"
        
        return cell
    }
}
