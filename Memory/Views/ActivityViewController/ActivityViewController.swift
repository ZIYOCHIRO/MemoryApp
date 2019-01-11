//
//  ActivityViewController.swift
//  Memory
//
//  Created by 10.12 on 2019/1/10.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
    
    @IBOutlet weak var backgroudImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var tripId: UUID!
    var tripModel: TripModel?
    var sectionHeaderHeight: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        TripFunctions.readTrips(by: tripId) { [weak self] (tripModel) in
            guard let self = self else { return }
            self.tripModel = tripModel
            guard let tripModel = tripModel else { return }
            self.title = tripModel.title  // this title will show in the navigation bar at center
            self.backgroudImageView.image = tripModel.image
            self.tableView.reloadData()
        }
        
        sectionHeaderHeight = tableView.dequeueReusableCell(withIdentifier: "headerCell")?.contentView.bounds.height ?? 44
    }

}

extension ActivityViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let dayModel = tripModel?.dayModels[section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderTableViewCell
        cell.setup(daymodel: dayModel!)
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let activityModel = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ActivityTableViewCell
        
        cell.setup(activityModel: activityModel!)
        
        return cell
    }

}


