//
//  ColorViewController.swift
//  SliderControlColor
//
//  Created by Denis on 18.02.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    private var viewBackground: UIColor? = .white

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = viewBackground
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailColorVC = segue.destination as? DetailColorViewController else {return}
        detailColorVC.delegate = self
        detailColorVC.color = viewBackground
    }
}
extension ColorViewController: ColorViewControllerDelegate {
    func setBackground(_ colorBackground: UIColor) {
        viewBackground = colorBackground
    }
    
    
}
