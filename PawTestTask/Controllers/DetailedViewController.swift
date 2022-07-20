//
//  DetailedViewController.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 07.07.2022.
//

import UIKit

class DetailedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var currentDate: UILabel!
    
    var transferedEquipmentData: TransferedEquipmentData?
    var transferedPersonnelData: TransferedPersonnelData?
    lazy var container = VariablesContainer()
    var day = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        initalCollectionViewSetup()
        setTransferedValues()
        setArrayValues()
        addPhotos()
        
    }
    //To overcome buggy NavigationBar
    override func viewWillAppear(_ animated: Bool) {
        changeNaigationTitleColor(color: UIColor.white)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        changeNaigationTitleColor(color: UIColor.black)
    }
    
    private func changeNaigationTitleColor(color: UIColor){
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
    
    // Adding photos from asssets
    private func addPhotos(){
        container.photosEquip = (0...14).compactMap { UIImage(named: "img\($0)") }
        container.photosPersonnel = (0...2).compactMap{ UIImage(named: "per\($0)") }
    }
    
    //Initial CollectionViewSetup
    private func initalCollectionViewSetup(){
        collectionView.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
        collectionView.backgroundView?.backgroundColor = UIColor.clear
        collectionView.backgroundColor = UIColor.clear
    }
    
    // Define what data was transfered from previous screen
    private func setTransferedValues(){
        if let transferedEquipmentData = transferedEquipmentData {
            container.detailesData = transferedEquipmentData
        }
        else {
            container.detailesData = transferedPersonnelData
        }
        
        currentDate.text = day
    }
    // Make an array of transfered data proprties
    private func setArrayValues(){
        container.details = (Mirror(reflecting: container.detailesData!).children.compactMap({ [$0.label, $0.value as? String]
        }))
    }
    // Remove redundant chars and capitalize letters from data
    private func setTitleValue(str: String) -> String{
        var newString = str
        newString = String(newString.replacingOccurrences(of: "_", with: " ").dropFirst()).capitalized
        return newString
    }
    // Find count of elements that are not nil
    private func excludeNilsCount(arr: [[String?]]) -> Int{
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
        return excludeNilsCount(arr: container.details)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCell", for: indexPath) as! DetailsCell

        if container.details[indexPath.item][1] != nil{
            cell.textLabel.text = setTitleValue(str: container.details[indexPath.item][0]!)
            cell.textValue.text = container.details[indexPath.item][1]
            
            if transferedEquipmentData != nil{
                cell.photo.image = container.photosEquip[Int(indexPath.item)]
            }
            else{
                cell.photo.image = container.photosPersonnel[Int(indexPath.item)]
            }
        }
        
        return cell
    }

}
