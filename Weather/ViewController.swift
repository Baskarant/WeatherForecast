//
//  ViewController.swift
//  Weather
//
//  Created by Baskaran T on 16/03/17.
//  Copyright © 2017 Baskaran T. All rights reserved.
//

import UIKit

enum imageFormat: String{
    case png
    case jpg
    case gif
}

class MainViewController: UIViewController {
    
    //properties
    
    var searchTask: URLSessionDataTask?
    var weathers: [Weather] = [Weather]()
    
    //outlets
    @IBOutlet weak var weathersTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //table extra configurations
        weathersTableView.separatorStyle = .none
        weathersTableView.tableFooterView = UIView()
        weathersTableView.contentInset = UIEdgeInsetsMake(4, 0, 4, 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchTask = Client.sharedInstance().getForcastByCity("London,UK") { (weathers, error) in
            if let weathers = weathers{
                self.weathers = weathers
                performUIUpdatesOnMain {
                    self.weathersTableView.reloadData()
                }
            }else{
                print(error ?? "error")
            }
        }
    }
    
}

//MARK: - MainViewController: UITableViewDelegate, UITableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /* Cell type */
        let cellReuseIdentifier = "weatherCell"
        let weather = weathers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as?
        WeatherTableViewCell
        
        /* set cell defaults*/
        
        cell?.tempLabel.text = "\(Int(weather.temp!))"
        cell?.locationLabel.text = "London, UK"
        cell?.weatherDescLabel.text = "\(weather.main!)"
        cell?.chanceOfRainLabel.text = "\(weather.clouds!)%"
        
        cell?.dateLabel.text = Weather.unixTimeConvertion(unixTime: weather.dateTIme!, format: "dd")
        cell?.dayLabel.text = Weather.unixTimeConvertion(unixTime: weather.dateTIme!, format: "E").uppercased()
        
        if let weatherIcon = weather.icon{
            let _ = Client.sharedInstance().taskForGETImage((weatherIcon), format: imageFormat.png.rawValue) { (imageData, error) in
                if let image = UIImage(data: imageData!){
                    performUIUpdatesOnMain {
                        cell?.weatherIconImageView.image = image
                    }
                } else{
                    print(error ?? "")
                }
            }
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
