//
//  ColorViewController.swift
//  SliderControlColor
//
//  Created by Denis on 18.02.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailColorVC = segue.destination as? DetailColorViewController else {return}
        detailColorVC.delegate = self
        detailColorVC.currentColor = view.backgroundColor
    }
}
extension ColorViewController: ColorViewControllerDelegate {
    func setBackground(_ colorBackground: UIColor) {
        view.backgroundColor = colorBackground
    }
    
    
}
