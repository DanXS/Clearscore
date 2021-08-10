//
//  ViewController.swift
//  ClearScore
//
//  Created by Dan Shepherd on 10/08/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var creditScoreView: CreditScoreView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string:"https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values") else {
            showError("Invalid URL")
            return
        }
        API.getCreditScore(url: url) { [unowned self] (score, error) in
            if let error = error {
                self.showError(error.localizedDescription)
            }
            else if let score = score {
                debugPrint("Score \(score.score), Max Score \(score.maxScoreValue)")
                self.creditScoreView.maxScore = CGFloat(score.maxScoreValue )
                self.creditScoreView.score = CGFloat(score.score)
                self.creditScoreView.setNeedsLayout()
                self.creditScoreView.setNeedsDisplay()
            }
            else {
                self.showError("Could not load credit score")
            }
        }
    }

    func showError(_ msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action) in
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }

}

