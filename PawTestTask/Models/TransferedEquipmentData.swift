//
//  TransferedData.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 07.07.2022.
//

import Foundation


// Data what I transfer to DetailedViewController
class TransferedEquipmentData{
    
    var _APC: String!
    var _tank: String!
    var _helicopter: String!
    var _aircraft: String!
    
    var _field_artillery: String!
    var _military_auto: String!
    var _fuel_tank: String!
    var _drone: String!
    var _naval_ship: String!
    var _anti_aircraft_warfare: String!
    
    var _special_equipment: String!
    var _mobile_SRBM_system: String!
    var _vehicles_and_fuel_tanks: String!
    var _cruise_missiles: String!
    
    init(_APC: String, _tank: String, _helicopter: String, _aircraft: String, _field_artillery: String, _military_auto: String, _fuel_tank: String, _drone: String, _naval_ship: String, _anti_aircraft_warfare: String){
        
        self._APC = _APC
        self._tank = _tank
        self._helicopter = _helicopter
        self._aircraft = _aircraft
        self._field_artillery = _field_artillery
        self._military_auto = _military_auto
        self._fuel_tank = _fuel_tank
        self._drone = _drone
        self._naval_ship = _naval_ship
        self._anti_aircraft_warfare = _anti_aircraft_warfare
        
    }
    func setSpecialEquipment(_special_equipment: String){
        self._special_equipment = _special_equipment
    }
    func setMobile(_mobile_SRBM_system: String){
        self._mobile_SRBM_system = _mobile_SRBM_system
    }
    func setVehicles(_vehicles_and_fuel_tanks: String){
        self._vehicles_and_fuel_tanks = _vehicles_and_fuel_tanks
    }
    func setCruise(_cruise_missiles: String){
        self._cruise_missiles = _cruise_missiles
    }
    
}
