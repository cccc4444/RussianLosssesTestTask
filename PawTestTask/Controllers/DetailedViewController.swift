//
//  DetailedViewController.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 07.07.2022.
//

import UIKit

class DetailedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!

    var transferedEquipmentData: TransferedEquipmentData?
    var transferedPersonnelData: TransferedPersonnelData?
    var detailesData : Any?
    var details = [[String?]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setDetailedValues()
        setArrayValues()
        initalCollectionViewSetup()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changeNaigationTitleColor(color: UIColor.white)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        changeNaigationTitleColor(color: UIColor.black)
    }
    
    
    
    
    //Initial CollectionViewSetup
    func initalCollectionViewSetup(){
        collectionView.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
        collectionView.backgroundView?.backgroundColor = UIColor.clear
        collectionView.backgroundColor = UIColor.clear
    }
    
    //To overcome buggy NavigationBar
    func changeNaigationTitleColor(color: UIColor){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        let appearance = UINavigationBarAppearance()
            appearance.largeTitleTextAttributes = [
                NSAttributedString.Key.foregroundColor: color,
                NSAttributedString.Key.font: UIFont(name: "AvenirNext-DemiBold", size: 31.0)!]
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.standardAppearance = appearance
    }
    
    // Define what data was transfered from previous screen
    func setDetailedValues(){
        if let transferedEquipmentData = transferedEquipmentData {
            self.detailesData = transferedEquipmentData
        }
        else {
            self.detailesData = transferedPersonnelData
        }
    }
    // Make an array of transfered data proprties
    func setArrayValues(){
        self.details = (Mirror(reflecting: detailesData!).children.compactMap({ [$0.label, $0.value as? String]
        }))
    }
    // Remove redundant chars and capitalize letters
    func setTitleValue(str: String) -> String{
        var newString = str
        newString = String(newString.replacingOccurrences(of: "_", with: " ").dropFirst()).capitalized
    
        return newString
    }
    // Find count of elements that are not nil
    func excludeNilsCount(arr: [[String?]]) -> Int{
        var counter = 0
        for i in arr{
            if i[1] != nil{
                counter += 1
            }
        }
        return counter
    }
    
    
    // MARK: IBActions

    @IBAction func closePressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
   
    
    //MARK: collectionView methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return excludeNilsCount(arr: details)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCell", for: indexPath) as! DetailsCell

        if details[indexPath.item][1] != nil{
            cell.textLabel.text = setTitleValue(str: details[indexPath.item][0]!)
            cell.textValue.text = details[indexPath.item][1]
        }
        
        return cell
    }

}
