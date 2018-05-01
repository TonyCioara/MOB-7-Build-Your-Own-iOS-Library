//
//  ViewController.swift
//  custom-view-practice
//
//  Created by Tony Cioara on 5/1/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addPatternView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addRedView() {
        let view = UIView(frame: CGRect(x: 20, y: 20, width: self.view.frame.width - 40, height: self.view.frame.height - 40))
        view.backgroundColor = UIColor.red
        self.view.addSubview(view)
    }

    func addChessView() {
        var xPos: CGFloat = 0
        var yPos: CGFloat = 0
        var squareCount = 0
        
        while yPos < self.view.frame.height {
            while xPos < self.view.frame.width {
                let view = UIView(frame: CGRect(x: xPos, y: yPos, width: 40, height: 40))
                if squareCount % 2 == 0 {
                    view.backgroundColor = UIColor.black
                } else {
                    view.backgroundColor = UIColor.lightGray
                }
                squareCount += 1
                self.view.addSubview(view)
                xPos += 40
            }
            squareCount += 1
            xPos = 0
            yPos += 40
        }
    }
    
    func addRainbowView() {
        
        var currentHue: CGFloat = 0.0
        
        while currentHue < 1.0 {
            
            let view = UIView(frame: CGRect(x: 0, y: self.view.frame.height * currentHue, width: self.view.frame.width, height: self.view.frame.height * 0.1))
            view.backgroundColor = UIColor(hue: currentHue, saturation: 1, brightness: 1, alpha: 1)
            self.view.addSubview(view)
            currentHue += 0.1
        }
    }
    
    func addRedLayeredView() {
        
        var squareCount: CGFloat = 0
        
        while squareCount < 10 {
            
            let saturation = 1.0 - squareCount / 10
            let squareSize = CGSize(width: self.view.frame.width - squareCount * 20, height: self.view.frame.height - squareCount * 20)
            
            let view = UIView()
            view.frame.size = squareSize
            view.backgroundColor = UIColor(hue: 0, saturation: saturation, brightness: 1, alpha: 1)
            view.center = self.view.center
            self.view.addSubview(view)
            
            squareCount += 1
        }
    }
    
    func addPatternView() {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pattern"))
        self.view.addSubview(view)
        
        let squareWidth = self.view.frame.width / 3
        let squareWidthOver3 = squareWidth / 3
        
        var xPos: CGFloat = squareWidthOver3
        var yPos: CGFloat = squareWidthOver3
        
        for _ in 1...3 {
            for _ in 1...2 {
                let view = UIView(frame: CGRect(x: xPos, y: yPos, width: squareWidth, height: squareWidth))
                view.backgroundColor = UIColor.black
                self.view.addSubview(view)
                xPos += squareWidth + squareWidthOver3
            }
            xPos = squareWidthOver3
            yPos += squareWidth + squareWidthOver3
        }
    }

}

