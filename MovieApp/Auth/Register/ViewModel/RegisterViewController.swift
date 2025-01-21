//
//  RegisterViewController.swift
//  MovieApp
//
//  Created by Kenan on 08.01.25.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    private var viewmodel: RegisterViewModel
    
    init(viewmodel: RegisterViewModel) {
        self.viewmodel = viewmodel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

}
