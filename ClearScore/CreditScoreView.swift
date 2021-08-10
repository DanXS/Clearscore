//
//  CreditScoreView.swift
//  ClearScore
//
//  Created by Dan Shepherd on 10/08/2021.
//

import UIKit

@IBDesignable
class CreditScoreView: UIView {
    
    @IBInspectable var maxScore: CGFloat = 700
    @IBInspectable var score: CGFloat = 100
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            fatalError("\(#function):\(#line) Failed to get current context.")
        }
        // Rect for outer cirle
        let outerRect = rect.inset(by: UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0))
        context.setFillColor(UIColor.white.cgColor)
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(2.0)
        // Draw circle
        context.addEllipse(in: outerRect)
        context.drawPath(using: .fillStroke)
        
        // Rect for inner arc
        let innerRect = outerRect.inset(by: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0))
        let center = CGPoint(x: innerRect.minX + innerRect.width/2.0, y:  innerRect.minY + innerRect.height/2.0)
        // Only draw arc if score and max score have sensible values
        if maxScore > 0.0 && score > 0.0 && score <= maxScore {
           
            let radius = innerRect.width/2.0
            let startAngle = -CGFloat.pi / 2.0
            let endAngle = startAngle + (score/maxScore) * 2.0 * CGFloat.pi
            context.setLineWidth(4.0)
            context.setStrokeColor(UIColor.orange.cgColor)
            // Draw arc - note context is flipped in iOS so using counter clockwise arc
            context.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            context.drawPath(using: .fillStroke)
            // Draw the black score text
            UIGraphicsPushContext(context)
            let blackFont = UIFont.systemFont(ofSize: 30)
            var string = NSAttributedString(string: "Your credit score is", attributes: [NSAttributedString.Key.font: blackFont])
            string.draw(at: CGPoint(x: center.x-120.0, y: center.y-70.0))
            UIGraphicsPopContext()
            UIGraphicsPushContext(context)
            string = NSAttributedString(string: "out of \(Int(maxScore))", attributes: [NSAttributedString.Key.font: blackFont])
            string.draw(at: CGPoint(x: center.x-80.0, y: center.y+60.0))
            UIGraphicsPopContext()
            // Draw the score text
            UIGraphicsPushContext(context)
            let scoreFont = UIFont.systemFont(ofSize: 90)
            string = NSAttributedString(string: "\(Int(score))", attributes: [NSAttributedString.Key.font: scoreFont, NSAttributedString.Key.foregroundColor : UIColor.orange])
            // Small hack to gestimate centering
            var x_offset : CGFloat = 80.0
            if score < 10 {
                x_offset = 40.0
            }
            else if score < 100 {
                x_offset = 60.0
            }
            string.draw(at: CGPoint(x: center.x - x_offset, y: center.y-40.0))
            UIGraphicsPopContext()
        }
    }

}
