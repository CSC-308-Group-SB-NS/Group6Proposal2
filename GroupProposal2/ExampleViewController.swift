//
//  ExampleViewController.swift
//  GroupProposal2
//
//  Created by Boston, Samuel T. on 4/6/26.
//

import UIKit

class ExampleViewController: UIViewController {

    let cars = ["2010 BMW", "2005 BMW", "2012 BMW", "2025 BMW"]
    let prices = ["$20,000-$40,000", "$10,000-$20,000", "$30,000-$50,000", "$50,000-$70,000"]
}

extension ExampleViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCell", for: indexPath)
        
        cell.textLabel?.text = cars[indexPath.section]
        cell.detailTextLabel?.text = prices[indexPath.section]
        cell.imageView?.image = UIImage(systemName: "car.fill")
        
        return cell
    }
    
}
