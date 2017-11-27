//
//  Squiggle.swift
//  Look Mom It Draws Color
//
//  Created by List,Christopher on 11/27/17.
//  Copyright © 2017 List,Christopher. All rights reserved.
//


import UIKit

class SquiggleView: UIView {
    
    var colors:[UIColor] = [UIColor.black, UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple]
    var colorIndex:Int = 0
    
    var lines:[UIBezierPath] = []
    var counter = 0
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(UIBezierPath())
        lines[counter].move(to: (touches.first!.location(in: self)))
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines[counter].addLine(to: touches.first!.location(in: self))
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines[counter].addLine(to: touches.first!.location(in: self))
        colors[colorIndex].setStroke()
        counter = counter + 1
        setNeedsDisplay()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        if lines.count == 0 {
            return
        }
        for bezier in lines {
            bezier.stroke()
        }
    }
    @IBAction func redBTN(_ sender: Any) {
        colorIndex = 1
    }
    @IBAction func orangeBTN(_ sender: Any) {
        colorIndex = 2
    }
    @IBAction func yellowBTN(_ sender: Any) {
        colorIndex = 3
    }
    @IBAction func greenBTN(_ sender: Any) {
        colorIndex = 4
    }
    @IBAction func blueBTN(_ sender: Any) {
        colorIndex = 5
    }
    @IBAction func purpleBTN(_ sender: Any) {
        colorIndex = 6
    }
    
}
