//
//  ViewController.swift
//  TicTacToe
//
//  Created by Andrew James Kinsey on 11/18/16.
//  Copyright © 2016 Andrew Kinsey. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
   
    @IBOutlet weak var gridView: UIView!
    @IBOutlet weak var labOne: GridLabel!
    @IBOutlet weak var labTwo: GridLabel!
    @IBOutlet weak var labThree: GridLabel!
    @IBOutlet weak var labFour: GridLabel!
    @IBOutlet weak var labFive: GridLabel!
    @IBOutlet weak var labSix: GridLabel!
    @IBOutlet weak var labSeven: GridLabel!
    @IBOutlet weak var labEight: GridLabel!
    @IBOutlet weak var labNine: GridLabel!
    
    var labelsArray : [GridLabel] = []
    
    var myGrid = GridLabel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelsArray = [labOne, labTwo, labThree, labFour, labFive, labSix, labSeven, labEight, labNine]
    }

    @IBAction func screenTapped(_ sender: UITapGestureRecognizer)
    {
        for label in labelsArray
        {
            if label.frame.contains(sender.location(in: gridView))
            {
                if label.canTap == true
                {
                    if myGrid.xTurn == true
                    {
                        label.text = "🍎"
                    }
                    else
                    {
                        label.text = "🍐"
                    }
                    myGrid.xTurn = !myGrid.xTurn
                    label.canTap = false
                    myGrid.count += 1
                    checkWinner()
                }
            }
        }
    }


    func checkWinner()
    {
        if labOne.text == labTwo.text && labTwo.text == labThree.text && labOne.text != ""
        {
            win(labThree.text!)
            print("Winner!")
        }
        if labFour.text == labFive.text && labFive.text == labSix.text && labFour.text != ""
        {
            win(labFour.text!)
            print("Winner!")
        }
        if labSeven.text == labEight.text && labEight.text == labNine.text && labNine.text != ""
        {
            win(labNine.text!)
            print("Winner!")
        }
        if labOne.text == labFour.text && labFour.text == labSeven.text && labSeven.text != ""
        {
            win(labOne.text!)
            print("Winner!")
        }
        if labTwo.text == labFive.text && labFive.text == labEight.text && labEight.text != ""
        {
            win(labTwo.text!)
            print("Winner!")
        }
        if labThree.text == labSix.text && labSix.text == labNine.text && labNine.text != ""
        {
            win(labThree.text!)
            print("Winner!")
        }
        if labOne.text == labFive.text && labFive.text == labNine.text && labNine.text != ""
        {
            win(labOne.text!)
            print("Winner!")
        }
        if labThree.text == labFive.text && labFive.text == labSeven.text && labFive.text != ""
        {
            win(labThree.text!)
            print("Winner!")
        }
        if myGrid.count == 9
        {
            win("No one")
        }
    }
    
    func win(_ winner: String)
    {
        let alert = UIAlertController(title: winner + " is the winner!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        let resetButton = UIAlertAction(title: "Play Again", style: .default, handler:
            {
            (sender) in
                for labels in self.labelsArray
                {
                    labels.text = ""
                    labels.canTap = true
                }
                self.myGrid.xTurn = true
                self.myGrid.count = 0
            })
        alert.addAction(resetButton)
        present(alert, animated: true, completion: nil)
    }




}

