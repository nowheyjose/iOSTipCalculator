//
//  TipCalculatorViewController.swift
//  TipCalculator
//
//  Created by Jose-Rafael Diaz on 12/29/16.
//  Copyright © 2016 Jose-Rafael Diaz. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var amtField: UITextField!
    @IBOutlet weak var tipAmtLabel: UILabel!
    @IBOutlet weak var totalAmtLabel: UILabel!
    @IBOutlet weak var tipAmtSlider: UISlider!
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    @IBOutlet weak var numPeopleLabel: UILabel!
    @IBOutlet weak var numPeopleSlider: UISlider!
    @IBOutlet weak var amtPerPersonLabel: UILabel!

    // MARK: - Properties
    var tipCalc = TipCalc(amt: 0.00, tipPercent: 0.15)
    
    
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        amtField.text = String(format: "Enter Bill", arguments: [tipCalc.amt])
        tipAmtLabel.text = String(format: "%d%%%", arguments: [Int(tipCalc.tipPercent * 100)])
        numPeopleLabel.text = String(format: "Split: %d", arguments: [Int(numPeopleSlider.value)])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: AnyObject)
    {
        tipCalculation()
        splitBill()
        view.endEditing(true)
    }
    
    func tipCalculation()
    {
        let bill = Float(amtField.text!) ?? 0
        tipCalc.tipPercent = Float(tipAmtSlider.value)
        tipCalc.amt = bill
        tipCalc.calcTip()
        updateUI()
    }
    
    func updateUI()
    {
        totalAmtLabel.text = String(format: "Total: $%0.2f Tip: $%0.2f", arguments: [tipCalc.totalAmt, tipCalc.tipAmt])
        amtPerPersonLabel.text = String(format: "Total Per Person: $%0.2f", arguments: [tipCalc.splitTotal])
    }
    
    // MARK: - UI Control Events

    @IBAction func updatedAmt(_ sender: AnyObject)
    {
        tipCalculation()
        splitBill()
    }
    
    @IBAction func updateTipAmtSlider(_ sender: AnyObject)
    {
        tipPercentLabel.text! = String(format: "%d%%", arguments: [Int(tipAmtSlider.value * 100)])
        tipCalculation()
        splitBill()
    }
    
    func splitBill()
    {
        let bill = Float(amtField.text!) ?? 0
        tipCalc.numDining = Float(numPeopleSlider.value)
        tipCalc.amt = bill
        tipCalc.calcSplit()
        updateUI()
    }
    
    @IBAction func updateNumPeopleSlider(_ sender: AnyObject)
    {
        numPeopleLabel.text! = String(format: "Split: %d", arguments: [Int(numPeopleSlider.value)])
        splitBill()
        
    }
    
    
    
}










