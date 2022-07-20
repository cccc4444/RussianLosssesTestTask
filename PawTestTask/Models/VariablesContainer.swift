//
//  VariablesContainer.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 09.07.2022.
//

import Foundation
import UIKit

struct VariablesContainer{
    
    // Category the user chose on initial screen
    var categoryPressed = 0
    var chosenDatatype = 0
    
    // names of files
    let JSONEquipFileName: String = "russia_losses_equipment"
    let JSONPersonFileName: String = "russia_losses_personnel"

    // for objects storage
    var equipObjects: [EquipmentAfterManipulation] = []
    var personnelObjects: [Person] = []
    
    var detailesData : Any?
    var details = [[String?]]()
    var photosEquip = [UIImage]()
    var photosPersonnel = [UIImage]()

    // used to track at what index do these attributes start to appear in array of JSONs
    // so we could avoid potentials errors with initialization
    var counter = 0
    var indexArrayOfspecial_equipment = [Int]()
    var indexArrayOfmobile_SRBM_system = [Int]()
    var indexArrayOfvehicles_and_fuel_tanks = [Int]()
    var indexArrayOfcruise_missiles = [Int]()

    // Singleton so we can access these variables
    static var instance = VariablesContainer()
    
}
