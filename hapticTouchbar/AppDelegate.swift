//
//  AppDelegate.swift
//  hapticTouchbar
//
//  Created by Jeremy Louie on 12/15/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	// -----start of global data-----
	struct Intensity {
		var none = "none"
		var light = "light"
		var medium = "medium"
		var heavy = "heavy"
	}
	
	let tactileFeedbackIntensity = Intensity()
	lazy var intensity = tactileFeedbackIntensity.none		// no intensity by default
	var isActive = true		// when software is launched, tactile feedback is set to on by default
	let activeStatus = NSMenuItem(title: "Active: False", action: nil, keyEquivalent: "")
	let turnStatus = NSMenuItem(title: "Turn On", action: #selector(setTurnStatus(_:)), keyEquivalent: "")
	let intensityTitle = NSMenuItem(title: "Intensity: None", action: nil, keyEquivalent: "")
	// -----end of global data-----

	// creates application icon in menu bar w/ fixed length 
	let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
		if let button = statusItem.button {
		  button.image = NSImage(named:NSImage.Name("icon"))
		}
		constructMenu()
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}

	func constructMenu() {
		let mainMenu = NSMenu()
		let subMenu = NSMenu()
		
		mainMenu.addItem(activeStatus)
		mainMenu.addItem(turnStatus)
		mainMenu.addItem(NSMenuItem.separator())
		
		mainMenu.addItem(intensityTitle)
		
		let intensityMenuDropdown = NSMenuItem(title: "Set Intensity", action: nil, keyEquivalent: "")
		mainMenu.addItem(intensityMenuDropdown)
		mainMenu.setSubmenu(subMenu, for: intensityMenuDropdown)
		
		let noneIntensityTitle = NSMenuItem(title: "None", action: #selector(setNoneIntensity(_:)), keyEquivalent: "1")
		subMenu.addItem(noneIntensityTitle)
		let lightIntensityTitle = NSMenuItem(title: "Light", action: #selector(setLightIntensity(_:)), keyEquivalent: "2")
		subMenu.addItem(lightIntensityTitle)
		let mediumIntensityTitle = NSMenuItem(title: "Medium", action: #selector(setMediumIntensity(_:)), keyEquivalent: "3")
		subMenu.addItem(mediumIntensityTitle)
		let heavyIntensityTitle = NSMenuItem(title: "Heavy", action: #selector(setHeavyIntensity(_:)), keyEquivalent: "4")
		subMenu.addItem(heavyIntensityTitle)
		mainMenu.addItem(NSMenuItem.separator())
		
		let quitTitle = NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
		mainMenu.addItem(quitTitle)

		statusItem.menu = mainMenu
	}
	
	@objc func setTurnStatus(_ sender: Any?) {
		isActive.toggle()		// if isActive == True --> isActive = False (vice-versa as well)
		if (isActive == false) {
			activeStatus.title = "Active: True"
			turnStatus.title = "Turn Off"
		} else {
			activeStatus.title = "Active: False"
			turnStatus.title = "Turn On"
		}
	}
	
	@objc func setNoneIntensity(_ sender: Any?) {
		intensityTitle.title = "Intensity: None"
	}
	
	@objc func setLightIntensity(_ sender: Any?) {
		intensityTitle.title = "Intensity: Light"
	}

	@objc func setMediumIntensity(_ sender: Any?) {
		intensityTitle.title = "Intensity: Medium"	}
	
	@objc func setHeavyIntensity(_ sender: Any?) {
		intensityTitle.title = "Intensity: Heavy"
	}
}
