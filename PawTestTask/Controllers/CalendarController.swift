//
//  CalendarController.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 06.07.2022.
//

import UIKit

class CalendarController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    
	@IBOutlet weak var monthLabel: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!
    
	var selectedDate = Date("2022-02-25")
	var totalSquares = [String]()
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
		setCellsView()
		setMonthView()
        navigationBarSetup()
        JSONParser()
	}

    func navigationBarSetup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
	func setCellsView()
	{
		let width = (collectionView.frame.size.width - 2) / 7
		let height = (collectionView.frame.size.height - 2) / 8
		let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
		flowLayout.itemSize = CGSize(width: width, height: height)
	}
	
	func setMonthView()
	{
		totalSquares.removeAll()
		
		let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
		let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
		let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
		
		var count: Int = 1
        // adding the whitespaces in the callendar to fill 6 rows
		while(count <= 42)
		{
			if(count <= startingSpaces || count - startingSpaces > daysInMonth)
			{
				totalSquares.append("")
			}
			else
			{
				totalSquares.append(String(count - startingSpaces))
			}
			count += 1
		}
		
		monthLabel.text = CalendarHelper().monthString(date: selectedDate)
			+ " " + CalendarHelper().yearString(date: selectedDate)
        
		collectionView.reloadData()
	}
    
    func initializeTransferedPersonnelData(record: Person) -> TransferedPersonnelData{
        let transferedPersonnelData = TransferedPersonnelData(day: record.day, personnel: record.personnel, pow: record.pow
        )
        return transferedPersonnelData
    }
    func initializeTransferedEquipmentData(record: EquipmentAfterManipulation) -> TransferedEquipmentData{
        let transferedEquipmentData = TransferedEquipmentData(_day: record.day, _APC: record.APC, _tank: record.tank, _helicopter: record.helicopter, _aircraft: record.aircraft, _field_artillery: record.field_artillery, _military_auto: record.military_auto, _fuel_tank: record.fuel_tank, _drone: record.drone, _naval_ship: record.naval_ship, _anti_aircraft_warfare: record.anti_aircraft_warfare)

            if let special_equipment = record.special_equipment {
                transferedEquipmentData.setSpecialEquipment(_special_equipment: special_equipment)
            }
            if let mobile_SRBM_system = record.mobile_SRBM_system{
                transferedEquipmentData.setMobile(_mobile_SRBM_system: mobile_SRBM_system)
            }
            if let vehicles_and_fuel_tanks = record.vehicles_and_fuel_tanks{
                transferedEquipmentData.setVehicles(_vehicles_and_fuel_tanks: vehicles_and_fuel_tanks)
            }
            if let cruise_missiles = record.cruise_missiles{
                transferedEquipmentData.setCruise(_cruise_missiles: cruise_missiles)
            }
        return transferedEquipmentData
    }
    
    // MARK: IBActions
    @IBAction func previousMonth(_ sender: Any)
    {
        if (CalendarHelper().isFirstMonth(date: selectedDate)){
            self.showToast(message: "Not available")
        }else {
            selectedDate = CalendarHelper().minusMonth(date: selectedDate)
            setMonthView()
        }
        
    }
    @IBAction func nextMonth(_ sender: Any)
    {
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        setMonthView()
    }
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override open var shouldAutorotate: Bool
    {
        return false
    }
    
    // MARK: Collection view data delegate and data source methods
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		totalSquares.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "callendarCell", for: indexPath) as! CalendarCell
        
        cell.dayOfMonth.text = totalSquares[indexPath.item]
		return cell
	}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let detailedVC = storyboard?.instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController

        if totalSquares[indexPath.item] != ""{
            let clickedDate = CalendarHelper().compileDate(date: selectedDate, day: totalSquares[indexPath.item])
            if clickedDate < VariablesContainer.instance.equipObjects.first!.date || clickedDate > VariablesContainer.instance.equipObjects.last!.date{
            showToast(message: "No info")
        }
            
            switch VariablesContainer.instance.segmentedControlValue{
            case 0:
            for record in VariablesContainer.instance.equipObjects where clickedDate == record.date{
                let instanceOfEquipmentData = initializeTransferedEquipmentData(record: record)
                detailedVC?.transferedEquipmentData = instanceOfEquipmentData
                self.navigationController?.pushViewController(detailedVC!, animated: true)
            }
            default:
            for record in VariablesContainer.instance.personnelObjects where clickedDate == record.date{
                let instanceOfPersonnelData = initializeTransferedPersonnelData(record: record)
                detailedVC?.transferedPersonnelData = instanceOfPersonnelData
                self.navigationController?.pushViewController(detailedVC!, animated: true)
            }
            
        }
        
        }
    }
}

