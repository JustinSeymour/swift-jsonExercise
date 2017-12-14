//
//  ViewController.swift
//  jsonExercise
//
//  Created by Justin Seymour on 2017/12/14.
//  Copyright © 2017 Justin Seymour. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct WebsiteDescription: Decodable {
        let name: String
        let description: String
        let courses: [Course]
    }

    struct Course: Decodable {
        let id: Int
        let name: String
        let link: String
        let imageUrl: String
        
//        init(json: [String: Any]) {
//            id = json["id"] as? Int ?? -1
//            name = json["name"] as? String ?? ""
//            link = json["link"] as? String ?? ""
//            imageUrl = json["imageUrl"] as? String ?? ""
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            
            do {
                
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription.name, websiteDescription.description)
                
//                let courses = try JSONDecoder().decode([Course].self, from: data)
//                print(courses)
            } catch let jsonErr {
                
            }
            
            
            
            // ** Store data response from completion handler as a string and print it out to the console ** //
            // ================================================================================================
            
            // let dataAsString = String(data: data, encoding: .utf8)
            // print(dataAsString as Any)
            
            
            // ** TODO: comment ** //
            // ================================================================================================
            //            do {
            //                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
            //
            //                let course = Course(json: json)
            //                print(course.name)
            //
            //            } catch let jsonErr {
            //                print("Error printing json")
            //            }
            
            
        }.resume()
        
    }



}

