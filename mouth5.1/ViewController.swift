//
//  ViewController.swift
//  mouth5.1
//
//  Created by Rashit Osmonov on 23/3/22.
//

import UIKit
import GoogleMaps
import SnapKit
import MapKit

class ViewController: UIViewController, UISearchResultsUpdating {
    
    private lazy var mapView: GMSMapView = {
        let camera = GMSCameraPosition(latitude: 42.882004, longitude: 74.582748, zoom: 1)
        return GMSMapView(frame: .zero, camera: camera)
    }()
    private var search =  UISearchController(searchResultsController: Search())
    
    private lazy var plusButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "plus.magnifyingglass"), for: .normal)
        view.tintColor = .white
        view.addTarget(self, action: #selector(clickPlus(view:)), for: .touchUpInside)
        view.backgroundColor = .black
        return view
    }()
    private lazy var minusButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "minus.magnifyingglass"), for: .normal)
        view.tintColor = .white
        view.addTarget(self, action: #selector(clickMinus(view:)), for: .touchUpInside)
        view.backgroundColor = .black
        return view
    }()
    @objc func clickPlus(view: UIButton) {
        let camera = GMSCameraPosition(target: mapView.camera.target, zoom: mapView.camera.zoom + 0.1)
        
    }
    @objc func clickMinus(view: UIButton) {
        let camera = GMSCameraPosition(target: mapView.camera.target, zoom: mapView.camera.zoom - 0.1)
        
        var item = GMSMarker()
        item.position = CLLocationCoordinate2D(latitude: 42.882004, longitude: 74.582748)
        item.map = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        search.searchResultsUpdater = self
        navigationItem.searchController
        search.searchBar.backgroundColor = .secondarySystemBackground
        
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mapView.addSubview(minusButton)
        minusButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(15)
            make.bottom.equalToSuperview()
            make.width.height.equalTo(100)
        }
        mapView.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.right.equalTo(minusButton.snp.left).offset(10)
            make.bottom.equalToSuperview()
            make.width.height.equalTo(100)
        }
       
        
        mapView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top)
    }
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}






