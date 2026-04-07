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
    var selectedIndexPath: IndexPath?
}

extension IndexViewController: UITableViewDataSource, UITableViewDelegate
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        tableView.deselectRow(at: indexPath, animated: true)
        if (indexPath.section == 0)
        {
            performSegue(withIdentifier: "InfoView", sender: self)
        }
        else if (indexPath.section == 1)
        {
            performSegue(withIdentifier: "TeamView", sender: self)
        }
        else
        {
            performSegue(withIdentifier: "ExampleView", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = selectedIndexPath else { return }
        
        if segue.identifier == "InfoView" {
            if let destinationVC = segue.destination as? InfoViewController {
                destinationVC.projectDetail = projectNames[indexPath.row]
            }
        }
        else if segue.identifier == "TeamView" {
            if let destinationVC = segue.destination as? TeamViewController {
                destinationVC.teamName = teamNames[indexPath.row]
            }
        }
    }
}
