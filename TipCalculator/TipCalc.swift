//
//  TipCalc.swift
//  TipCalculator
//
//  Created by Jose-Rafael Diaz on 12/30/16.
//  Copyright © 2016 Jose-Rafael Diaz. All rights reserved.
//

import Foundation

class TipCalc
{
    var tipAmt: Float = 0
    var amt: Float = 0
    var tipPercent: Float = 0
    var totalAmt: Float = 0
    var numDining: Float = 0
    var splitTotal: Float = 0
    
    init(amt: Float, tipPercent: Float)
    {
        self.amt = amt
        self.tipPercent = tipPercent
    }
    
    func calcTip()
    {
        tipAmt = amt * tipPercent
        totalAmt = tipAmt + amt
    }
    
    func calcSplit()
    {
        tipAmt = amt * tipPercent
        splitTotal = (tipAmt + amt)/numDining
    }
    
}
