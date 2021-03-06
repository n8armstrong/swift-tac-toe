//
//  ViewController.swift
//  SwiftTacToe
//
//  Created by Nate Armstrong on 6/2/14.
//  Copyright (c) 2014 Nate Armstrong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var buttonTL : UIButton
  @IBOutlet var buttonTM : UIButton
  @IBOutlet var buttonTR : UIButton
  @IBOutlet var buttonML : UIButton
  @IBOutlet var buttonMM : UIButton
  @IBOutlet var buttonMR : UIButton
  @IBOutlet var buttonBL : UIButton
  @IBOutlet var buttonBM : UIButton
  @IBOutlet var buttonBR : UIButton
  var game: Game
  var buttons: UIButton[]

  init(coder aDecoder: NSCoder!)  {
    self.buttons = []
    self.game = Game(buttons: self.buttons)
    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.buttons = [
      buttonTL, buttonTM, buttonTR,
      buttonML, buttonMM, buttonMR,
      buttonBL, buttonBM, buttonBR
    ]
    self.game = Game(buttons: buttons)
  }

  @IBAction func buttonWasPressed(sender : UIButton) {
    self.game.pressButton(NSArray(array: self.buttons).indexOfObject(sender))
    updateUI()
  }

  func updateUI() {
    for button in buttons {
      let b = self.game.buttonAtIndex(NSArray(array: self.buttons).indexOfObject(button))
      if b.active {
        button.setTitle(b.player?.label(), forState: UIControlState.Normal)
        button.titleLabel.font = UIFont.systemFontOfSize(80)
        button.setTitleColor(b.player?.color(), forState: UIControlState.Normal)
      }
      else {
        button.setTitle("", forState: UIControlState.Normal)
      }
    }
  }

  @IBAction func clear(sender : UIButton) {
    self.game.clear()
    updateUI()
  }
}

