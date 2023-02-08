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
    
    let url2 = "https://openlibrary.org/works/OL15626917W.json"
    
    @IBAction func api2(_ sender: Any) {
        getData2(from: url2)
    }
    
    let url3 = "https://api.artic.edu/api/v1/artworks"

    @IBAction func api3(_ sender: Any) {
        getData3(from: url3)

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
    
    private func getData2(from url2: String)
        
        {
            
            let task = URLSession.shared.dataTask(with: URL(string: url2)!, completionHandler: {data, response, error in
                guard let data = data, error == nil
                else
                {
                    print("something went wrong")
                    return
                }
                
                var result : Response2?
                
                do
                {
                    result = try JSONDecoder().decode(Response2.self, from: data)
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
                
                
                    print(json.created.type)
                    print(json.created.value)
                
            })
            task.resume()
        }
    
    private func getData3(from url3: String)
        
        {
            
            let task = URLSession.shared.dataTask(with: URL(string: url3)!, completionHandler: {data, response, error in
                guard let data = data, error == nil
                else
                {
                    print("something went wrong")
                    return
                }
                
                var result : Response3?
                
                do
                {
                    result = try JSONDecoder().decode(Response3.self, from: data)
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
                
                                   print(json.pagination.total)
                                   print(json.pagination.limit)
                                   print(json.pagination.offset)
                                   print(json.pagination.total_pages)
                                   print(json.pagination.current_page)
                                   print(json.pagination.next_url)
                
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

struct Response2: Codable
{
let created: MyResult2

}

struct MyResult2: Codable{
    let type : String
    let value : String
    
}

struct Response3: Codable
{
let pagination: MyResult3
}

struct MyResult3: Codable{
    let total : Int
    let limit : Int
    let offset : Int
    let total_pages : Int
    let current_page : Int
    let next_url : String
}

