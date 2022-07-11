//
//  VariablesContainer.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 09.07.2022.
//

import Foundation

struct VariablesContainer{
    
    let JSONEquipFileName: String = "russia_losses_equipment"
    let JSONPersonFileName: String = "russia_losses_personnel"
    
    var segmentedControlValue: Int = 0
    
    var isGridView = true

    // for objects storage
    var equipObjects: [EquipmentAfterManipulation] = []
    var personnelObjects: [Person] = []

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
