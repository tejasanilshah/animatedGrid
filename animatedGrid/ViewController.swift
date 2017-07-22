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
    
    let numberOfColumns = 10
    var cells = [String: UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenWidth = view.frame.width
        let screenHeight = view.frame.height
        let cellViewWidth = screenWidth/CGFloat(numberOfColumns)
        let numberOfRows = Int(screenHeight/cellViewWidth)
        
        for j in 0...numberOfRows{
            for i in 0...numberOfColumns{
                let cellView = UIView(frame: CGRect(x: CGFloat(i)*(cellViewWidth), y: CGFloat(j)*(cellViewWidth) , width: cellViewWidth, height: cellViewWidth))
                cellView.backgroundColor = randomColor()
                cellView.layer.borderWidth = 1
                cellView.layer.borderColor = UIColor.white.cgColor
                view.addSubview(cellView)
                let key = "\(i)|\(j)"
                cells[key] = cellView
            }
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    
    func handlePan(gesture: UIPanGestureRecognizer) -> Void {
        let location = gesture.location(in: view)
        let screenWidth = view.frame.width
        let cellViewWidth = screenWidth/CGFloat(numberOfColumns)
        let i = Int(location.x/cellViewWidth)
        let j = Int(location.y/cellViewWidth)
        let cellView = cells["\(i)|\(j)"]
        cellView?.backgroundColor = .black
    }
    
    fileprivate func randomColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
}

