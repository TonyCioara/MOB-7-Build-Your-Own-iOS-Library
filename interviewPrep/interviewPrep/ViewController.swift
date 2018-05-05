//
//  ViewController.swift
//  interviewPrep
//
//  Created by Tony Cioara on 5/4/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let array = [[0,1,2,4],[2,7,1,2,5],[3],[5,4]]
        
        createSquaresWithArray(array: array)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createSquaresWithArray(array: Array<Array<Int>>) {
        
        let verticalCount = CGFloat(array.count)
//        print("Vertical count: \(verticalCount)")
        
        let height = ((self.view.frame.height - 10) / verticalCount) - 10
        
        var yPos: CGFloat = 10
        
        for subArray in array {
            
            let horizontalCount = CGFloat(subArray.count)
            
//            print("Horizontal count: \(horizontalCount)")
            
            let width = ((self.view.frame.width - 10) / horizontalCount) - 10
            
            var xPos: CGFloat = 10
            
            for _ in subArray {
                
                let newView = UIView(frame: CGRect(x: xPos, y: yPos, width: width, height: height))
                
                newView.backgroundColor = UIColor.lightGray
                
                self.view.addSubview(newView)
                
                xPos += width + 10
            }
            
            yPos += height + 10
        }
    }
    
    func createStaticSquaresWithArray(array: Array<Array<Int>>) {
        
        let squareSize = self.view.frame.width / 3 - 40
        
        var yPos: CGFloat = 10
        
        for subArray in array {
            
            var xPos: CGFloat = 10
            
            for index in subArray {
                
                if index % 3 == 0 && index != 0 {
                    print(index)
                    xPos = 10
                    yPos += self.view.frame.width + 10
                }
                
                let newView = UIView(frame: CGRect(x: xPos, y: yPos, width: squareSize, height: squareSize))
                
                newView.backgroundColor = UIColor.lightGray
                
                self.view.addSubview(newView)
                
                xPos += self.view.frame.width / 3 - 30
            }
            
            yPos += self.view.frame.width / 3 - 30
        }
    }

}

