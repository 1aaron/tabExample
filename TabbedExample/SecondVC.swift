//
//  SecondVC.swift
//  TabbedExample
//
//  Created by Developer on 9/10/18.
//  Copyright © 2018 Aaron. All rights reserved.
//

import UIKit
import MapKit

class SecondVC: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //1.- agregar las vistas, crear la clase para la celda
    //2.- Agregar los locations para el source, y el locationManager para escuchar las ubicaciones
    
    @IBOutlet weak var tableLocations: UITableView!
    let locationManager = CLLocationManager()
    var locations = [CLLocation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLocationRequesting()
        tableLocations.delegate = self
        tableLocations.dataSource = self
    }
    func startLocationRequesting() {
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations[0])
        let loc = locations[0]
        self.locations.append(loc)
        tableLocations.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CellVC2 {
            let location = self.locations[indexPath.row]
            cell.lblLatitude.text = String(location.coordinate.latitude)
            cell.lblLongitude.text = String(location.coordinate.longitude)
            return cell
        } else {
            return CellVC2()
        }
    }
}
