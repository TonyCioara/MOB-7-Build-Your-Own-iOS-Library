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
        addPrettySunLayer()
        
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
    
    //  Practice #2
    
    func addGradientLayer() {
        
        let gradient = CAGradientLayer()
        
        gradient.frame = self.view.bounds
        
        let color1 = UIColor(red: 252/255, green: 217/255, blue: 97/255, alpha: 1)
        let color2 = UIColor(red: 247/255, green: 107/255, blue: 28/255, alpha: 1)

        gradient.colors = [color1.cgColor, color2.cgColor]
        
        self.view.layer.addSublayer(gradient)
    }
    
    func addPrettySunLayer() {
        
//        Draw sky gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        let color1 = UIColor.white
        let color2 = UIColor.cyan
        
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        self.view.layer.addSublayer(gradientLayer)
        
//        Draw Sun
        let sunPath = UIBezierPath(arcCenter: CGPoint(x: self.view.frame.width / 3 * 2, y: 100), radius: 50, startAngle: CGFloat(0), endAngle: CGFloat.pi * 2, clockwise: true)
        
        let sunLayer = CAShapeLayer()
        sunLayer.path = sunPath.cgPath
        
        sunLayer.fillColor = UIColor.yellow.cgColor
        sunLayer.shadowColor = UIColor.yellow.cgColor
        sunLayer.shadowRadius = 20
        sunLayer.shadowOpacity = 0.8
        
        self.view.layer.addSublayer(sunLayer)
        
//        Draw cliffs
        let cliff1Path = UIBezierPath()
        cliff1Path.move(to: CGPoint(x: 0, y: self.view.frame.height / 5 * 3))
        cliff1Path.addCurve(to: CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 5 * 4), controlPoint1: CGPoint(x: self.view.frame.width / 2 - 40, y: self.view.frame.height / 5 * 4 - 40), controlPoint2: CGPoint(x: 40, y: self.view.frame.height / 5 * 4))
        cliff1Path.addCurve(to: CGPoint(x: self.view.frame.width, y: self.view.frame.height / 5 * 3), controlPoint1: CGPoint(x: self.view.frame.width / 5 * 4, y: self.view.frame.height / 5 * 4 + 40), controlPoint2: CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 5 * 3))
        cliff1Path.addLine(to: CGPoint(x: self.view.frame.width, y: self.view.frame.height))
        cliff1Path.addLine(to: CGPoint(x: 0, y: self.view.frame.height))
        cliff1Path.close()
        
        let cliff1Shape = CAShapeLayer()
        cliff1Shape.path = cliff1Path.cgPath
        cliff1Shape.fillColor = UIColor.brown.cgColor
        cliff1Shape.strokeColor = UIColor.red.cgColor
        cliff1Shape.lineWidth = 5
        
        self.view.layer.addSublayer(sunLayer)
    }
    
    //  Practice #1

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

