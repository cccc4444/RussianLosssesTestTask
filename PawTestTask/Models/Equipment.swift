//
//  Equipment.swift
//  PawAttempt3
//
//  Created by Danylo Kushlianskyi on 06.07.2022.
//

import Foundation


// initial struct in which I save the data of Equipment Json
struct Equipment : Codable {
    var date: String
    var day: Int
    var aircraft: Int
    var helicopter: Int
    var tank: Int
    var APC: Int
    var field_artillery : Int
    var MRL: Int
    var military_auto: Int
    var fuel_tank: Int
    var drone: Int
    var naval_ship: Int
    var anti_aircraft_warfare: Int
    var special_equipment: Int
    var mobile_SRBM_system: Int
    var vehicles_and_fuel_tanks: Int
    var cruise_missiles: Int

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
        self.day = try valueContainer.decode(Int.self, forKey: CodingKeys.day)
        self.aircraft = try valueContainer.decode(Int.self, forKey: CodingKeys.aircraft)
        self.helicopter = try valueContainer.decode(Int.self, forKey: CodingKeys.helicopter)
        self.tank = try valueContainer.decode(Int.self, forKey: CodingKeys.tank)
        self.APC = try valueContainer.decode(Int.self, forKey: CodingKeys.APC)
        self.field_artillery = try valueContainer.decode(Int.self, forKey: CodingKeys.field_artillery)
        self.MRL = try valueContainer.decode(Int.self, forKey: CodingKeys.MRL)
        self.military_auto = try valueContainer.decode(Int.self, forKey: CodingKeys.military_auto)
        self.fuel_tank = try valueContainer.decode(Int.self, forKey: CodingKeys.fuel_tank)
        self.drone = try valueContainer.decode(Int.self, forKey: CodingKeys.drone)
        self.naval_ship = try valueContainer.decode(Int.self, forKey: CodingKeys.naval_ship)
        self.anti_aircraft_warfare = try valueContainer.decode(Int.self, forKey: CodingKeys.anti_aircraft_warfare)
        self.special_equipment = try valueContainer.decode(Int.self, forKey: CodingKeys.special_equipment)
        self.mobile_SRBM_system = try valueContainer.decode(Int.self, forKey: CodingKeys.mobile_SRBM_system)
        self.vehicles_and_fuel_tanks = try valueContainer.decode(Int.self, forKey: CodingKeys.vehicles_and_fuel_tanks)
        self.cruise_missiles = try valueContainer.decode(Int.self, forKey: CodingKeys.cruise_missiles)
    }
}
