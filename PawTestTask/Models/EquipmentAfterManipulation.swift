//
//  EquipmentAfterManipulation.swift
//  PawAttempt3
//
//  Created by Danylo Kushlianskyi on 06.07.2022.
//

import Foundation


// struct in which I save the data after dealing with traps and converting all values to String
struct EquipmentAfterManipulation : Codable {
    var date: String
    var day: String
    var aircraft: String
    var helicopter: String
    var tank: String
    var APC: String
    var field_artillery : String
    var MRL: String
    var military_auto: String
    var fuel_tank: String
    var drone: String
    var naval_ship: String
    var anti_aircraft_warfare: String
    var special_equipment: String?
    var mobile_SRBM_system: String?
    var vehicles_and_fuel_tanks: String?
    var cruise_missiles: String?

    enum CodingKeys: String, CodingKey {
        case date
        case day
        case aircraft
        case helicopter
        case tank
        case APC
        case field_artillery = "field artillery"
        case MRL
        case military_auto = "military auto"
        case fuel_tank = "fuel tank"
        case drone
        case naval_ship = "naval ship"
        case anti_aircraft_warfare = "anti-aircraft warfare"
        case special_equipment = "special equipment"
        case mobile_SRBM_system = "mobile SRBM system"
        case vehicles_and_fuel_tanks = "vehicles and fuel tanks"
        case cruise_missiles = "cruise missiles"

    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try valueContainer.decode(String.self, forKey: CodingKeys.date)
        self.day = try valueContainer.decode(String.self, forKey: CodingKeys.day)
        self.aircraft = try valueContainer.decode(String.self, forKey: CodingKeys.aircraft)
        self.helicopter = try valueContainer.decode(String.self, forKey: CodingKeys.helicopter)
        self.tank = try valueContainer.decode(String.self, forKey: CodingKeys.tank)
        self.APC = try valueContainer.decode(String.self, forKey: CodingKeys.APC)
        self.field_artillery = try valueContainer.decode(String.self, forKey: CodingKeys.field_artillery)
        self.MRL = try valueContainer.decode(String.self, forKey: CodingKeys.MRL)
        self.military_auto = try valueContainer.decode(String.self, forKey: CodingKeys.military_auto)
        self.fuel_tank = try valueContainer.decode(String.self, forKey: CodingKeys.fuel_tank)
        self.drone = try valueContainer.decode(String.self, forKey: CodingKeys.drone)
        self.naval_ship = try valueContainer.decode(String.self, forKey: CodingKeys.naval_ship)
        self.anti_aircraft_warfare = try valueContainer.decode(String.self, forKey: CodingKeys.anti_aircraft_warfare)
        if VariablesContainer.instance.indexArrayOfspecial_equipment.contains(VariablesContainer.instance.counter){
            self.special_equipment = try valueContainer.decode(String.self, forKey: CodingKeys.special_equipment)
        }
        if VariablesContainer.instance.indexArrayOfmobile_SRBM_system.contains(VariablesContainer.instance.counter){
            self.mobile_SRBM_system = try valueContainer.decode(String.self, forKey: CodingKeys.mobile_SRBM_system)
        }
        if VariablesContainer.instance.indexArrayOfvehicles_and_fuel_tanks.contains(VariablesContainer.instance.counter){
            self.vehicles_and_fuel_tanks = try valueContainer.decode(String.self, forKey: CodingKeys.vehicles_and_fuel_tanks)
        }
        if VariablesContainer.instance.indexArrayOfcruise_missiles.contains(VariablesContainer.instance.counter){
            self.cruise_missiles = try valueContainer.decode(String.self, forKey: CodingKeys.cruise_missiles)
        }
        VariablesContainer.instance.counter += 1
    }
}
