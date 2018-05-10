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
        addCrazyView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    //  Practice #3
    
    func addCrazyView() {
        
        let view = UIView(frame: CGRect(x: 20, y: 20, width: self.view.frame.width - 40, height: self.view.frame.height - 40))
        view.layer.cornerRadius = 15
        view.backgroundColor = .red
        self.view.addSubview(view)
        
        UIView.animateKeyframes(withDuration: 5.0, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.05, animations: {
                view.frame = CGRect(x: self.view.frame.width / 2 - 15, y: self.view.frame.height / 2 - 15, width: 30, height: 30)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.05, animations: {
                view.frame = CGRect(x: self.view.frame.width / 2 - 15, y: (self.view.frame.height - self.view.frame.width * 7 / 8) / 2, width: 30, height: 50)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.05, animations: {
                view.frame = CGRect(x: self.view.frame.width / 16, y: (self.view.frame.height - self.view.frame.width * 7 / 8) / 2, width: self.view.frame.width * 7 / 8, height: 50)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.05, animations: {
                view.frame = CGRect(x: self.view.frame.width / 16, y: (self.view.frame.height - self.view.frame.width * 7 / 8) / 2, width: self.view.frame.width * 7 / 8, height: self.view.frame.width * 7 / 8)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.05, animations: {
                view.frame = CGRect(x: self.view.frame.width / 2 - 15, y: self.view.frame.height - 90, width: 30, height: 30)
                view.backgroundColor = .cyan
            })
        }, completion: nil)
    }
    
    func addAnimatedBoxes() {
        
        var xPosition: CGFloat = 0
        var hue: CGFloat = 0.0
        for i in 0...5 {
            let view = UIView(frame: CGRect(x: xPosition, y: self.view.frame.height, width: self.view.frame.width / 5, height: self.view.frame.width / 5))
            view.backgroundColor = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
            hue += 0.2
            
            self.view.addSubview(view)
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width / 5, height: self.view.frame.width / 5))
            label.text = String(i + 1)
            label.textAlignment = .center
            label.font = UIFont(name: ".SFUIText-Medium", size: 34)!
            label.textColor = .white
            
            view.addSubview(label)
            
            UIView.animate(withDuration: 0.5, delay: TimeInterval(i) * 0.3, options: [], animations: {
                view.frame = CGRect(x: xPosition, y: self.view.frame.height - self.view.frame.width / 5, width: self.view.frame.width / 5, height: self.view.frame.width / 5)
            }, completion: nil)
            
            xPosition += self.view.frame.width / 5
        }
    }
    
    func addAnimatedBoxesWithBounce() {
        
        var xPosition: CGFloat = 0
        var hue: CGFloat = 0.0
        for i in 0...4 {
            let view = UIView(frame: CGRect(x: xPosition, y: self.view.frame.height, width: self.view.frame.width / 5, height: self.view.frame.width / 5))
            view.backgroundColor = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
            hue += 0.2
            
            self.view.addSubview(view)
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width / 5, height: self.view.frame.width / 5))
            label.text = String(i + 1)
            label.textAlignment = .center
            label.font = UIFont(name: ".SFUIText-Medium", size: 34)!
            label.textColor = .white
            
            view.addSubview(label)
            
            UIView.animate(withDuration: 0.5, delay: TimeInterval(i) * 0.3, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.1, options: [], animations: {
                view.frame = CGRect(x: xPosition, y: self.view.frame.height - self.view.frame.width / 5, width: self.view.frame.width / 5, height: self.view.frame.width / 5)
            }, completion: nil)
            
            xPosition += self.view.frame.width / 5
        }
    }
    
    func addAnimatedBoxesWithBounceAndLabels() {
        
        addAnimatedBoxesWithBounce()
        
        let lightGrayLabelView = UILabel(frame: CGRect(x: 0, y: self.view.frame.height - self.view.frame.width / 5 - 30, width: self.view.frame.width, height: 30))
        
        let darkGrayLabelView = UILabel(frame: CGRect(x: 0, y: self.view.frame.height - self.view.frame.width / 5 - 60, width: self.view.frame.width, height: 30))
        
        darkGrayLabelView.backgroundColor = UIColor.lightGray
        darkGrayLabelView.text = " This is a bold title"
        darkGrayLabelView.font = UIFont(name: ".SFUIText-Bold", size: 18)!
        darkGrayLabelView.textColor = .black
        darkGrayLabelView.alpha = 0.0
        
        lightGrayLabelView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        lightGrayLabelView.text = " Some subtitle text "
        lightGrayLabelView.font = UIFont(name: ".SFUIText", size: 18)!
        lightGrayLabelView.textAlignment = .right
        lightGrayLabelView.textColor = .black
        lightGrayLabelView.alpha = 0.0
        
        self.view.addSubview(lightGrayLabelView)
        self.view.addSubview(darkGrayLabelView)
        
        UIView.animate(withDuration: 0.7, delay: 1.3, options: UIViewAnimationOptions(), animations: {
            darkGrayLabelView.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 1.6, options: UIViewAnimationOptions(), animations: {
            lightGrayLabelView.alpha = 1.0
        }, completion: nil)
        
        
//        let gradientView = UIView(frame: CGRect(x: 0, y: self.view.frame.height - self.view.frame.width / 5 - 65, width: 0, height: 5))
        let gradientView = UIView(frame: CGRect(x: 0 - self.view.frame.width, y: self.view.frame.height - self.view.frame.width / 5 - 65, width: self.view.frame.width, height: 5))
        
        let gradient = CAGradientLayer()
        
        let color1 = UIColor(red: 252/255, green: 217/255, blue: 97/255, alpha: 1)
        let color2 = UIColor(red: 247/255, green: 107/255, blue: 28/255, alpha: 1)
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        gradient.colors = [color1.cgColor, color2.cgColor]
        
        gradient.frame = gradientView.bounds
        
        gradientView.layer.addSublayer(gradient)
        self.view.addSubview(gradientView)
        
        UIView.animate(withDuration: 0.7, delay: 2.0, options: UIViewAnimationOptions(), animations: {
            gradientView.frame = CGRect(x: 0, y: self.view.frame.height - self.view.frame.width / 5 - 65, width: self.view.frame.width, height: 5)
        }, completion: nil)
        
        

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
//        cliff1Shape.strokeColor = UIColor.red.cgColor
//        cliff1Shape.lineWidth = 5
        
        self.view.layer.addSublayer(cliff1Shape)
    }
    
    //  Practice #1
    
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
    
    //    My animations
    
    func fillScreenWithBoxes() {
        
        self.view.backgroundColor = .black
        
        //        let gradient = CAGradientLayer()
        //
        //        let color1 = UIColor(red: 252/255, green: 217/255, blue: 97/255, alpha: 1)
        //        let color2 = UIColor(red: 247/255, green: 107/255, blue: 28/255, alpha: 1)
        //
        //        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        //        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        //        gradient.colors = [color1.cgColor, color2.cgColor]
        
        var count = 0
        var yPosition: CGFloat = 0
        
        while yPosition < self.view.frame.height {
            
            let view = UIView(frame: CGRect(x: 0, y: yPosition + self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height / 200))
            
            //            gradient.frame = view.bounds
            //            view.layer.addSublayer(gradient)
            view.backgroundColor = .white
            
            self.view.addSubview(view)
            
            UIView.animate(withDuration: 1.0, delay: TimeInterval(count) * 0.01, options: [.curveEaseIn], animations: {
                view.frame = CGRect(x: 0, y: yPosition, width: self.view.frame.width, height: self.view.frame.height / 200)
            }, completion: nil)
            
            count += 1
            
            yPosition += self.view.frame.height / 200
        }
    }

}

