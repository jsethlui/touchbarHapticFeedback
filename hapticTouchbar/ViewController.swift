//
//  ViewController.swift
//  hapticTouchbar
//
//  Created by Jeremy Louie on 12/15/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	static var aKeyLogger = Keylogger()	// when app is launched, software begins tracking user pressed keys

	override func viewDidLoad() {
		super.viewDidLoad()

		ViewController.aKeyLogger.start()
		
		ViewController.aKeyLogger.stop()
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

