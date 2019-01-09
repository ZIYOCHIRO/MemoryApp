//
//  TripsViewController.swift
//  Memory
//
//  Created by 10.12 on 2019/1/5.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrips { [weak self] in
            self?.tableView.reloadData()
        }
        
        // you must change tableView background and cell background color to clear in storyboard.
        view.backgroundColor = Theme.background
        // if you check the clip to bounds in IB, then there will be no shadow!
        addButton.createFloatingActionButton()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripViewController
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension TripsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell
        cell.setUp(tripModel: Data.tripModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            
            let trip = Data.tripModels[indexPath.row]
            let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you wanna delete the trip: \(trip.title) ?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                // perforom delete
                TripFunctions.deleteTrip(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
                //alternative: - tableView.reloadData()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        delete.image = #imageLiteral(resourceName: "delete")
        delete.backgroundColor = Theme.tint
        return UISwipeActionsConfiguration(actions: [delete])
    }
    

}
