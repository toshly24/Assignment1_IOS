//
//  ViewController.swift
//  Assignment1_ChooseYourAPI
//
//  Created by Toshly Tomy on 2023-02-08.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
        
    }
    let url1 = "https://phonevalidation.abstractapi.com/v1/"
    @IBAction func api1(_ sender: Any) {
        getData1(from: url1)

    }
    private func getData1(from url1: String)
           
           {
               
               let task = URLSession.shared.dataTask(with: URL(string: url1)!, completionHandler: {data, response, error in
                   guard let data = data, error == nil
                   else
                   {
                       print("something went wrong")
                       return
                   }
                   
                   var result : Response1?
                   
                   do
                   {
                       result = try JSONDecoder().decode(Response1.self, from: data)
                   }
                   catch
                   {
                       print("failed to convert")
                   }
                   
                   guard let json = result
                   else
                   {
                       return
                   }
                   
                   
                       print(json.error.message)
                       print(json.error.code)
                     
                     
                   
               })
               task.resume()
           }

}

struct Response1: Codable
{
let error: MyResult1

}

struct MyResult1: Codable{
    let message : String
    let code : String

}
