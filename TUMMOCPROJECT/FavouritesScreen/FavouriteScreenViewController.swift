//
//  FavouriteScreenViewController.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import UIKit
import CoreData
import SDWebImage

class FavouriteScreenViewController: UIViewController ,FavouriteScreenViewProtocol,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array4.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteScreenTableViewCell", for: indexPath) as! FavouriteScreenTableViewCell
        
        cell.tabledata1 = array4[indexPath.row]
        
        cell.tabledata2 = array5[indexPath.row]
        
        cell.tabledata3 = array6[indexPath.row]
        
                
        return cell
    }
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    func viewHomeScreenSuccess(message: String, HomeScreenSuccess: [String : Any]) {
        print("")
    }
    
    
    var presenter: FavouriteScreenPresenterProtocol?
    
    var namedata : String?

    var pricedata : String?
    
    var  icondata : String?
    
    
    var array1 = [Any]()
    var array2 = [Any]()
    var array3 = [Any]()
    
    var array4 = [String]()
    var array5 = [String]()
    var array6 = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.reloadData()
        
        print("favouritescreen")
        
        tableview.register(UINib(nibName: "FavouriteScreenTableViewCell", bundle: nil), forCellReuseIdentifier: "FavouriteScreenTableViewCell")
        
        tableview.delegate = self
        tableview.dataSource = self
        
        print("first screen")
        
        
        let noteFetch: NSFetchRequest<Firstresponse> = Firstresponse.fetchRequest()
       
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let result = try? context.fetch(noteFetch)
        
        
        for data in result as! [NSManagedObject] {
            
            
            let data1 = data.value(forKey: #keyPath(Firstresponse.name))
            
            let data2 = data.value(forKey: #keyPath(Firstresponse.price))
            
            let data3 = data.value(forKey: #keyPath(Firstresponse.icon))
           
            AppDelegate.sharedAppDelegate.coreDataStack.managedContext.delete(data)
        
            
            array1 = [data1 ?? 0]
            array2 = [data2 ?? 0]
            array3 = [data3 ?? 0]
            
            
            for i in array1.enumerated() {
                
                array4.append("\(i.element)")
                
            }
            
            for i in array2.enumerated() {
                
                array5.append("\(i.element)")
                
            }
            
            for i in array3.enumerated() {
                
                array6.append("\(i.element)")
                
            }
            
       
            
        }
        
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
