//
//  HomeHeaderView.swift
//  MovieApp
//
//  Created by Kenan on 19.12.24.
//

import UIKit

class HomeHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createUI() {
        backgroundColor = .red
        setupButtons()
        addGradient()
    }
    
    lazy var playButton: ReasubleButton = {
        let button = ReasubleButton(buttonImage: UIImage(systemName: "play.fill"), onAction: {[weak self] in self?.playButtonTapped()})
        return button
    }()
    
    
    lazy var downloadButton: ReasubleButton = {
        let button = ReasubleButton(buttonImage: UIImage(systemName: "arrow.down.to.line.alt"), onAction: {[weak self] in self?.downloadButtonTapped()})
        return button
    }()
    
    private func setupButtons() {
        let stackView = UIStackView(arrangedSubviews: [playButton, downloadButton])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -sccreenHeight * 0.04),
            stackView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            playButton.heightAnchor.constraint(equalToConstant: sccreenHeight * 0.03),
            downloadButton.heightAnchor.constraint(equalToConstant: sccreenHeight * 0.03)
        ])
    }
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.withAlphaComponent(0.8).cgColor, UIColor.clear.cgColor]
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
        layer.addSublayer(gradientLayer)
    }
    
    @objc func playButtonTapped() {
        
    }
    
    @objc func downloadButtonTapped() {
        
    }
    
}

