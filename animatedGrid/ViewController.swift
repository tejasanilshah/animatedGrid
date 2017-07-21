//
//  ViewController.swift
//  animatedGrid
//
//  Created by Tejas Anil Shah on 21/07/17.
//  Copyright © 2017 Tejas. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenWidth = view.frame.width
        let screenHeight = view.frame.height
        let numberOfColumns = 10
        let cellViewWidth = screenWidth/CGFloat(numberOfColumns)
        let numberOfRows = Int(screenHeight/cellViewWidth)
        for j in 1...numberOfRows{
            for i in 1...numberOfColumns{
                let cellView = UIView(frame: CGRect(x: CGFloat(i-1)*(cellViewWidth), y: 25 + CGFloat(j-1)*(cellViewWidth) , width: cellViewWidth, height: cellViewWidth))
                cellView.backgroundColor = randomColor()
                cellView.layer.borderWidth = 1
                cellView.layer.borderColor = UIColor.white.cgColor
                view.addSubview(cellView)
            }
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    
    func handlePan(gesture: UIPanGestureRecognizer) -> Void {
        let location = gesture.location(in: view)
        print(location)
    }
    
    fileprivate func randomColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
}

