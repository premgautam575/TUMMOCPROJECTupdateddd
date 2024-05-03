//
//  HomeScreenViewController.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation
import UIKit
import CoreData
import SDWebImage

protocol HomeScreenViewProtocol: class {
    
    var presenter: HomeScreenPresenterProtocol? { get set }
    
    func viewHomeScreenSuccess(message: String,HomeScreenSuccess:[String:Any])
    
}

class HomeScreenViewController: UIViewController,HomeScreenViewProtocol,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var foodcollectionview: UICollectionView!
    
    @IBOutlet weak var giftcollectionview: UICollectionView!
    
    @IBOutlet weak var drinkcollectionview: UICollectionView!
    
    
    
    
    @IBOutlet weak var cartnumber: UILabel!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == foodcollectionview{
          return 4
        }
        else if collectionView == giftcollectionview{
         return 3
        }
       else {
          return 3
        }
     return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == foodcollectionview{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionViewCell", for: indexPath) as! FoodCollectionViewCell
            
            cell.addcartvaluebtn.tag = indexPath.row
            
            cell.addcartvaluebtn.addTarget(self, action: #selector(cartbtntapped(_:)), for: .touchUpInside)
        
            cell.favouritebtn.tag = indexPath.row
            
            cell.favouritebtn.addTarget(self, action: #selector(favouritebtntapped(_:)), for: .touchUpInside)
            
            let dict =   ["first":data1[0],"second":data1[1],"third":data1[2]]
            
            let data4 = data1[0] as! [String:Any]
            
            let data5 = data1[1] as! [String:Any]
            
            let data6 = data1[2] as! [String:Any]
            
           
            let data7 = data4["items"]
                        
            let data8 = data5["items"]
            
            let data9 = data6["items"]
            
            
            let dict2 =   ["first":data7]
            
            let data10 = dict2["first"] as! [Any]
            
            
            let icondata1 = data10[0] as! [String:Any]
            
            let icondata2 = data10[1] as! [String:Any]
            
            let icondata3 = data10[2] as! [String:Any]
            
            let icondata4 = data10[3] as! [String:Any]
            
            let icondata5 = data10[4] as! [String:Any]
            
           
            
            let iconarray:[String] = [icondata1["icon"] as! String,icondata2["icon"] as! String,icondata3["icon"] as! String,icondata4["icon"] as! String]
            
            let namearray:[String] = [icondata1["name"] as! String,icondata2["name"] as! String,icondata3["name"] as! String,icondata4["name"] as! String]
            
            let pricearray:[String] = [("\(icondata1["price"] ?? 0)") ,("\(icondata2["price"] ?? 0)"),("\(icondata3["price"] ?? 0)"),("\(icondata4["price"] ?? 0)")]
            
            print(iconarray)
            
            if indexPath.row < 4 {
                
                indexPath.row < 4
                
                cell.tabledata = namearray[indexPath.row]
                
                cell.tabledata2 = pricearray[indexPath.row]
                
                cell.tabledata3 = iconarray[indexPath.row]
                
                self.namearray = namearray
                
                self.pricearray = pricearray
                
                self.iconarray = iconarray
                
                self.cartnamearray = namearray
                
                self.cartpricearray = pricearray
                
                self.carticonarray = iconarray
                
            }
           
            return cell
            
        }
        
        else if collectionView == giftcollectionview {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCollectionViewCell", for: indexPath) as! GiftCollectionViewCell
            
            cell.cartbtn.tag = indexPath.row
            
            cell.cartbtn.addTarget(self, action: #selector(cartbtntapped2(_:)), for: .touchUpInside)
            
            cell.favoutiteBtn.tag = indexPath.row
            
            cell.favoutiteBtn.addTarget(self, action: #selector(favouritebtntapped1(_:)), for: .touchUpInside)
            
            let dict =   ["first":data1[0],"second":data1[1],"third":data1[2]]
            
            let data4 = data1[0] as! [String:Any]
            
            let data5 = data1[1] as! [String:Any]
            
            let data6 = data1[2] as! [String:Any]
            
           
            let data7 = data4["items"]
                        
            let data8 = data5["items"]
            
            let data9 = data6["items"]
            
            
            let dict2 =   ["first":data8]
            
            let data10 = dict2["first"] as! [Any]
            
            
            let icondata1 = data10[0] as! [String:Any]
            
            let icondata2 = data10[1] as! [String:Any]
            
            let icondata3 = data10[2] as! [String:Any]
            
            let iconarray:[String] = [icondata1["icon"] as! String,icondata2["icon"] as! String,icondata3["icon"] as! String]
            
            let namearray:[String] = [icondata1["name"] as! String,icondata2["name"] as! String,icondata3["name"] as! String]
            
            let pricearray:[String] = [("\(icondata1["price"] ?? 0)") ,("\(icondata2["price"] ?? 0)"),("\(icondata3["price"] ?? 0)")]
            
            print(iconarray)
            
            if indexPath.row < 4 {
                
                indexPath.row < 4
                
                cell.tabledata = namearray[indexPath.row]
                
                cell.tabledata2 = pricearray[indexPath.row]
                
                cell.tabledata3 = iconarray[indexPath.row]
                
                self.namearray1 = namearray
                
                self.pricearray1 = pricearray
                
                self.iconarray1 = iconarray
                
                self.cartnamearray1 = namearray
                
                self.cartpricearray1 = pricearray
                
                self.carticonarray1 = iconarray
            }
           
            return cell
           
        }
        
        else{
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DrinkCollectionViewCell", for: indexPath) as! DrinkCollectionViewCell
            
            cell.cartbtn.tag = indexPath.row
            
            cell.cartbtn.addTarget(self, action: #selector(cartbtntapped3(_:)), for: .touchUpInside)
            
            cell.favouritebtn.tag = indexPath.row
            
            cell.favouritebtn.addTarget(self, action: #selector(favouritebtntapped2(_:)), for: .touchUpInside)
            
            let dict =   ["first":data1[0],"second":data1[1],"third":data1[2]]
            
            let data4 = data1[0] as! [String:Any]
            
            let data5 = data1[1] as! [String:Any]
            
            let data6 = data1[2] as! [String:Any]
            
           
            let data7 = data4["items"]
                        
            let data8 = data5["items"]
            
            let data9 = data6["items"]
            
            
            let dict2 =   ["first":data9]
            
            let data10 = dict2["first"] as! [Any]
            
            
            let icondata1 = data10[0] as! [String:Any]
            
            let icondata2 = data10[1] as! [String:Any]
            
            let icondata3 = data10[2] as! [String:Any]
            
            
            let iconarray:[String] = [icondata1["icon"] as! String,icondata2["icon"] as! String,icondata3["icon"] as! String]
            
            var namearray:[String] = [icondata1["name"] as! String,icondata2["name"] as! String,icondata3["name"] as! String]
            
            let pricearray:[String] = [("\(icondata1["price"] ?? 0)") ,("\(icondata2["price"] ?? 0)"),("\(icondata3["price"] ?? 0)")]
            
            print(iconarray)
            
            if indexPath.row < 4 {
                
                indexPath.row < 4
                
                cell.tabledata = namearray[indexPath.row]
                
                cell.tabledata2 = pricearray[indexPath.row]
                
                cell.tabledata3 = iconarray[indexPath.row]
                
                self.namearray2 = namearray
                
                self.pricearray2 = pricearray
                
                self.iconarray2 = iconarray
                
                self.cartnamearray2 = namearray
                
                self.cartpricearray2 = pricearray
                
                self.carticonarray2 = iconarray
                
            }
           
            return cell
        }
    }
    
    @objc func cartbtntapped(_ sender:AnyObject)  {
        let tag = sender.tag
        
        let tagcount = [tag]
        
  
        
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let newNote1 = Firstresponse(context: context)
        
            newNote1.setValue(cartnamearray[tag ?? 0], forKey: #keyPath(Firstresponse.name))
            
            newNote1.setValue(cartpricearray[tag ?? 0], forKey: #keyPath(Firstresponse.price))
            
            newNote1.setValue(carticonarray[tag ?? 0], forKey: #keyPath(Firstresponse.icon))
      
            AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
     
    }
    
    @objc func cartbtntapped2(_ sender:AnyObject)  {
        let tag = sender.tag
        
        let tagcount = [tag]
        
        
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let newNote1 = Firstresponse(context: context)
        
            newNote1.setValue(cartnamearray1[tag ?? 0], forKey: #keyPath(Firstresponse.name))
            
            newNote1.setValue(cartpricearray1[tag ?? 0], forKey: #keyPath(Firstresponse.price))
            
            newNote1.setValue(carticonarray1[tag ?? 0], forKey: #keyPath(Firstresponse.icon))
      
            AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
     
    }
    
    @objc func cartbtntapped3(_ sender:AnyObject)  {
        let tag = sender.tag
        
        let tagcount = [tag]
        
    
      
        
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let newNote1 = Firstresponse(context: context)
        
            newNote1.setValue(cartnamearray2[tag ?? 0], forKey: #keyPath(Firstresponse.name))
            
            newNote1.setValue(cartpricearray2[tag ?? 0], forKey: #keyPath(Firstresponse.price))
            
            newNote1.setValue(carticonarray2[tag ?? 0], forKey: #keyPath(Firstresponse.icon))
      
            AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
     
    }
    
    @objc func favouritebtntapped(_ sender:AnyObject)  {
        let tag = sender.tag
        
        let tagcount = [tag]
        

        
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let newNote1 = Firstresponse(context: context)
        
       
            newNote1.setValue(namearray[tag ?? 0], forKey: #keyPath(Firstresponse.name))
            
            newNote1.setValue(pricearray[tag ?? 0], forKey: #keyPath(Firstresponse.price))
            
            newNote1.setValue(iconarray[tag ?? 0], forKey: #keyPath(Firstresponse.icon))
      
            
            AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
     
       
   
    }
   
    @objc func favouritebtntapped1(_ sender:AnyObject) {
        let tag = sender.tag
        
        let tagcount = [tag]
        
    
        
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let newNote1 = Firstresponse(context: context)
        
        newNote1.setValue(namearray1[tag ?? 0], forKey: #keyPath(Firstresponse.name))
        
        newNote1.setValue(pricearray1[tag ?? 0], forKey: #keyPath(Firstresponse.price))
        
        newNote1.setValue(iconarray1[tag ?? 0], forKey: #keyPath(Firstresponse.icon))
 
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
    
   
    }
    
    @objc func favouritebtntapped2(_ sender:AnyObject)  {
        
        let tag = sender.tag
        
        let tagcount = [tag]
        
   
        
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let newNote1 = Firstresponse(context: context)
        
        newNote1.setValue(namearray2[tag ?? 0], forKey: #keyPath(Firstresponse.name))
        
        newNote1.setValue(pricearray2[tag ?? 0], forKey: #keyPath(Firstresponse.price))
        
        newNote1.setValue(iconarray2[tag ?? 0], forKey: #keyPath(Firstresponse.icon))
 
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        
        
    }
    
    @IBAction func cartbtn(_ sender: Any) {
        presenter?.presentingToCartScreen()
    }
    
    var presenter: HomeScreenPresenterProtocol?
    
    var HomeScreenResult : Categorydata?
    
    var data1 = [Any]()
    
    var namearray = [String]()
    
    var iconarray = [String]()
    
    var pricearray = [String]()
    
    var namearray1 = [String]()
    
    var iconarray1 = [String]()
    
    var pricearray1 = [String]()
    
    var namearray2 = [String]()
    
    var iconarray2 = [String]()
    
    var pricearray2 = [String]()
    
    var cartnamearray = [String]()
    
    var carticonarray = [String]()
    
    var cartpricearray = [String]()
    
    var cartnamearray1 = [String]()
    
    var carticonarray1 = [String]()
    
    var cartpricearray1 = [String]()
    
    var cartnamearray2 = [String]()
    
    var carticonarray2 = [String]()
    
    var cartpricearray2 = [String]()
    
    
    var itemdata = [Any]()
    
    
    
    func viewHomeScreenSuccess(message: String, HomeScreenSuccess: [String:Any])  {
        
        data1 = HomeScreenSuccess["categories"] as! [Any]

    }
  
    @IBAction func favouritebtn(_ sender: Any) {
        presenter?.presentingToFavouriteScreen()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()  
        
        let noteFetch: NSFetchRequest<Firstresponse> = Firstresponse.fetchRequest()
       
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let result = try? context.fetch(noteFetch)

        
        for data in result as! [NSManagedObject] {
            
            AppDelegate.sharedAppDelegate.coreDataStack.managedContext.delete(data)
        }
        
        foodcollectionview.delegate = self
        foodcollectionview.dataSource = self
        giftcollectionview.delegate = self
        giftcollectionview.dataSource = self
        drinkcollectionview.delegate = self
        drinkcollectionview.dataSource = self
        
        print("first screen")
        
        foodcollectionview.register(UINib(nibName: "FoodCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodCollectionViewCell")
        
        giftcollectionview.register(UINib(nibName: "GiftCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GiftCollectionViewCell")
        
        drinkcollectionview.register(UINib(nibName: "DrinkCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DrinkCollectionViewCell")
        
        presenter?.presentingHomeScreenDetails()

        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func Buttonaction(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
