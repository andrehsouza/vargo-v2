//
//  ThemeInitializer.swift
//  TheVargo
//
//  Created by Andre on 12/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import UIKit

class ThemeInitializer: Initializable {
    
    func performInitialization() {
        navigationBarAppearence()
        tableViewAppearence()
    }
    
}


extension ThemeInitializer {
    
    private func navigationBarAppearence() {
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().barTintColor = .mainColor
        UINavigationBar.appearance().prefersLargeTitles = false
        let titleArr: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.black, .font: UIFont(type: .regular, size: 25)]
        UINavigationBar.appearance().titleTextAttributes = titleArr
        UINavigationBar.appearance().largeTitleTextAttributes = titleArr
    }
    
    private func tableViewAppearence() {
        let colorView = UIView()
        colorView.alpha = 0.20
        colorView.backgroundColor = UIColor.gray.withAlphaComponent(0.20)
        UITableViewCell.appearance().selectedBackgroundView = colorView
    }
    
}
