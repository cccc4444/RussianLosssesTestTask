//
//  TransferedPersonnelData.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 08.07.2022.
//

import Foundation

// Data what I transfer to DetailedViewController
class TransferedPersonnelData {
    var _day: String
    var _personnel: String
    var _pow: String
    
    init( day: Int, personnel: Int, pow: Int) {
        self._day = String(day)
        self._personnel = String(personnel)
        self._pow = String(pow)
    }
}
