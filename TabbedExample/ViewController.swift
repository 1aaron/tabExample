//
//  ViewController.swift
//  TabbedExample
//
//  Created by Developer on 9/8/18.
//  Copyright © 2018 Aaron. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    //1.- agregar Map Kit View a la vista, hacerla de todo el grande
    //2.- importar MapKit, agregar los datos del viewDidLoad y el método de centrado
    //3.- Agregar anotaciones (primero crear la clase que extienda de annotation)
    //4.- Agregar locationManager, función para revisar permisos
    //5.- Agregar el permiso en el info.plist
    //6.- Crear el CLLocationManager y las configuraciones necesarias para mostrar la ubicación
    //7.- Crear un nuevo VC para mostrar una lista con als ubicaciones obtenidas
    //8.- Agregar un List al nuevo VC
    @IBOutlet weak var mainMap: MKMapView!
    
    let locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: 20.666824, longitude: -103.368546)
        centerMapOnLocation(location: initialLocation)
        
        let tecGurusLocation = CLLocationCoordinate2D(latitude: 20.667488, longitude: -103.368829)
        let myannotation = MyAnnotation(title: "Genérica", locationName: "Ubicación prueba", coordinate: tecGurusLocation)
        mainMap.addAnnotation(myannotation)
        
        startLocationRequesting()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations[0])
        let loc = locations[0]
        mainMap.addAnnotation(MyAnnotation(title: "New one", locationName: "incoming", coordinate: loc.coordinate))
    }
    func startLocationRequesting() {
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    //centrar el mapa a la región especificada
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mainMap.setRegion(coordinateRegion, animated: true)
    }
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mainMap.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

