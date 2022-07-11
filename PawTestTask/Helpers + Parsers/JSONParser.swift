//
//  JSONHelper.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 06.07.2022.
//

import Foundation

class JSONParser {
    
    static let parserInstance = JSONParser()
    
    // variables that will contain intermediary results after invoking the functions
    var oldJSONData: Data?
    var newJSONString: String = ""
    var newJSONData: Data?
    
    init() {
        self.oldJSONData = readLocalFile(VariablesContainer.instance.JSONEquipFileName)!
        self.newJSONString = removeTraps(oldJSONData!)
        self.newJSONData = convertStrToJSSON(newJSONString)
        checkIfHasPropertyForEquipment()
        fetchFromJSONFileEquipment { equip in
            VariablesContainer.instance.equipObjects = equip!
            fetchFromJSONFileMeat(VariablesContainer.instance.JSONPersonFileName) { meat in
                VariablesContainer.instance.personnelObjects = meat!
        }
    }
    
    
    // reading and returning a json in string format
    func readLocalFile(_ name: String) -> Data? {
        do{
            if let bundlePath = Bundle.main.url(forResource: name, withExtension: "json"),
               let jsonData = try String(contentsOf: bundlePath).data(using: .utf8){
                return jsonData
            }
        }
        catch{
            debugPrint(error)
        }
        return nil
    }

    // removing traps and converting json to one big string
    func removeTraps(_ data: Data) -> String{
        let jsonStr = String(decoding: data, as: UTF8.self)
        let correctedJsonStr = jsonStr
            .replacingOccurrences(of: "NaN", with: "\"No data\"")
            .replacingOccurrences(of: "\"9\"", with: "9")
            .replacingOccurrences(of: "\"21\"", with: "21")
        return correctedJsonStr
    }

    // converting big json string back to json
    func convertStrToJSSON(_ myString: String) -> Data?{
        let data = myString.data(using: .utf8)!
            do {
                if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]
                {
                    var newJsonArray = [Dictionary<String,String>]()
                    for record in jsonArray{
                        let newDict = Dictionary<String, String>(uniqueKeysWithValues:
                            record.map { key, value in (key, String(describing: value))})
                        newJsonArray.append(newDict)
                    }
                    let jsonData = try JSONSerialization.data(withJSONObject: newJsonArray, options: [])
                    return jsonData
                    
                } else {
                    print("bad json")
                }
            } catch let error as NSError {
                debugPrint(error)
            }

        return nil
    }

    // both functions below are needed to keep track of appearing new keys in JSON.
    func createEquipmentDictOfStrings() -> [Dictionary<String,String>]? {
        if let dict = try? JSONSerialization.jsonObject(with: newJSONData!, options : .allowFragments) as? [Dictionary<String,String>]{
            return dict
        }
        return nil
    }
    // if new keys appear then i put appearance index to specific array.
    func checkIfHasPropertyForEquipment(){
        if let dict = try? JSONSerialization.jsonObject(with: newJSONData!, options : .allowFragments) as? [Dictionary<String,String>]{
            for record in dict {
                if record.keys.contains("special equipment")
                {
                    let res = dict.firstIndex(of: record)
                    VariablesContainer.instance.indexArrayOfspecial_equipment.append(res!)
                }
                if record.keys.contains("mobile SRBM system"){
                    let res = dict.firstIndex(of: record)
                    VariablesContainer.instance.indexArrayOfmobile_SRBM_system.append(res!)
                }
                if record.keys.contains("vehicles and fuel tanks"){
                    let res = dict.firstIndex(of: record)
                    VariablesContainer.instance.indexArrayOfvehicles_and_fuel_tanks.append(res!)
                }
                if record.keys.contains("cruise missiles"){
                    let res = dict.firstIndex(of: record)
                    VariablesContainer.instance.indexArrayOfcruise_missiles.append(res!)
                }
                
                
            }
        }
    }

    // fetch data from json
    func fetchFromJSONFileEquipment(_ competion: @escaping ([EquipmentAfterManipulation]?) -> Void) {
        DispatchQueue.main.async {
            do{
                let myStruct = try JSONDecoder().decode([EquipmentAfterManipulation].self, from: self.newJSONData!)
                competion(myStruct)
            }
            catch {
                debugPrint(error)
                competion(nil)
            }
        }
        
    }
    func fetchFromJSONFileMeat(_ name: String,_ completion: @escaping ([Person]?) -> Void){
        if let url = Bundle.main.url(forResource: name, withExtension: "json"){
            DispatchQueue.main.async {
                do{
                    let data = try Data(contentsOf: url)
                    let myStruct = try JSONDecoder().decode([Person].self, from: data)
                    completion(myStruct)
                }
                catch {
                    debugPrint(error)
                    completion(nil)
                }
            }
        }
    }
    
    }
}

