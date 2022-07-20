//
//  ViewController.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 06.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var equipmentView: CategoryView!
    @IBOutlet weak var personnelView: CategoryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
        
        gestureRecognizersSetup()
    }
    
    @IBAction func showTablePressed() {
        guard VariablesContainer.instance.chosenDatatype != 0 else {
            chooseCategoryAlert()
            return
        }

        let calendarVC = self.storyboard?.instantiateViewController(withIdentifier: "CalendarController") as? UINavigationController
            if let sheet = calendarVC?.sheetPresentationController {
                sheet.detents = [
                        .medium(),
                        .large()]
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.prefersGrabberVisible = true
                sheet.largestUndimmedDetentIdentifier = .medium
                sheet.preferredCornerRadius = 20
                sheet.prefersEdgeAttachedInCompactHeight = true
            }
            present(calendarVC!, animated: true)
    }
    
    func gestureRecognizersSetup(){
        let gestureEquipment = UITapGestureRecognizer(target: self, action:  #selector(self.equipPressed))
        let gesturePersonnel = UITapGestureRecognizer(target: self, action:  #selector(self.personnelPressed))
        self.equipmentView.addGestureRecognizer(gestureEquipment)
        self.personnelView.addGestureRecognizer(gesturePersonnel)
    }
    
    @objc func equipPressed(sender : UITapGestureRecognizer) {
        VariablesContainer.instance.chosenDatatype = 1
        pressedAnimation(sender: equipmentView, second: personnelView)
    }
    @objc func personnelPressed(sender : UITapGestureRecognizer) {
        VariablesContainer.instance.chosenDatatype = 2
        pressedAnimation(sender: personnelView, second: equipmentView)
    }
    
    func pressedAnimation(sender: UIView, second: UIView){
        UIView.animate(withDuration: 0.2,
            animations: {
            sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            if second == self.equipmentView{
                second.transform = CGAffineTransform(translationX: -10, y:0)
            }
            else{
                second.transform = CGAffineTransform(translationX: 10, y:0)
            }})
    }

    func chooseCategoryAlert(){
        let alert = UIAlertController(title: "Sorry", message: "You have to choose a category first", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}

