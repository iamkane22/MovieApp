//
//  Reasuble.swift
//  MovieApp
//
//  Created by Kenan on 19.12.24.
//

import UIKit
class ReasubleButton : UIButton {
    
    private  var buttonImage: UIImage?
    var onAction: () -> Void
    
    init(buttonImage: UIImage? = nil, onAction: @escaping () -> Void) {
        self.buttonImage = buttonImage
        self.onAction = onAction
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        if let image = buttonImage {
        setImage(image, for: .normal)
        }
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 10
        tintColor = .white
        addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

    }
    
    @objc func buttonAction() {
        onAction()
    }
    
}
