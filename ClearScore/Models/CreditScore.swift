//
//  CreditScore.swift
//  ClearScore
//
//  Created by Dan Shepherd on 10/08/2021.
//

import Foundation

struct CreditScore {
    var maxScoreValue : Int = 0
    var score : Int = 0
    // Failable init in case of parse errors
    init?(json : Dictionary<String, Any>) {
        guard let creditReportInfo = json["creditReportInfo"] as? Dictionary<String, Any>  else {
            return nil
        }
        guard let maxScoreValue = creditReportInfo["maxScoreValue"] as? Int else {
            return nil
        }
        guard let score = creditReportInfo["score"] as? Int else {
            return nil
        }
        self.maxScoreValue = maxScoreValue
        self.score = score
    }
}
