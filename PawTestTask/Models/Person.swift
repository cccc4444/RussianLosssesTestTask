//
//  Person.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 06.07.2022.
//

import Foundation

struct Person : Codable{
    var date: String
    var day: Int
    var personnel: Int
    var personnelAsterisc: String
    var pow: Int
    
    enum CodingKeys: String, CodingKey{
        case date
        case day
        case personnel
        case personnelAsterisc = "personnel*"
        case pow = "POW"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try valueContainer.decode(String.self, forKey: CodingKeys.date)
        self.day = try valueContainer.decode(Int.self, forKey: CodingKeys.day)
        self.personnel = try valueContainer.decode(Int.self, forKey: CodingKeys.personnel)
        self.personnelAsterisc = try valueContainer.decode(String.self, forKey: CodingKeys.personnelAsterisc)
        self.pow = try valueContainer.decode(Int.self, forKey: CodingKeys.pow)
    }
    
    
}
