//
//  TripViewController.swift
//  Itinerary App
//
//  Created by Hany Karam on 2/15/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class TripViewController: UIViewController  {
    
     @IBOutlet weak var addbutton: UIButton!
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TripFunctions.readTrips(complection:  {
            [weak self] in
            self?.tableview.reloadData()
            
        })
        addbutton.layer.cornerRadius = addbutton.frame.height / 2
    addbutton.layer.shadowOpacity = 0.25
        addbutton.layer.shadowRadius = 5
        addbutton.layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToAddTripSeque"{
            let popup = segue.destination as! AddTripsViewController
            popup.doneSaving = { [weak self] in
                self?.tableview.reloadData()
            }
        }
    }
    
}
extension TripViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell") as! TripTableViewCell
        
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 211
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trip = Data.tripModels[indexPath.row]
        let delet = UIContextualAction(style: .destructive, title: "delet") {  (UIContextualAction , view , actionPerformed : @escaping (Bool) -> () ) in
           let alert = UIAlertController(title: "DELET TRIP ", message: "ARE U WANT TI DELET THIS TRIP!\(trip.tite)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alerAction) in
                actionPerformed(false)
            }))
            alert.addAction(UIAlertAction(title: "Delet", style: .destructive, handler: { (alertAction) in
                TripFunctions.deleteTrip(Index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
        
         self.present(alert,animated: true)
         }
        
        return UISwipeActionsConfiguration(actions: [delet])

    }
}
