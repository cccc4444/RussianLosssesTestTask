//
//  ViewController.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 06.07.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    override func viewWillDisappear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
    }
    
    
    
    @IBAction func selectedControlChosen(_ sender: Any) {
        VariablesContainer.instance.segmentedControlValue = segmentedControl.selectedSegmentIndex
    }
    @IBAction func showTablePressed() {
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
    


}

