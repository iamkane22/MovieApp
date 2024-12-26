//
//  HomeVC.swift
//  MovieApp
//
//  Created by Kenan on 19.12.24.
//

import UIKit

class HomeVC: BaseViewController {
    private let viewModel: HomeViewModel
    weak var coordinator: AppCoordinator?
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
lazy var tableView: UITableView = {
        let tableView = UITableView()
    tableView.backgroundColor = .cyan
    return tableView
}()
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.getMovieList()
    }


    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let homeView = HomeHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.35))
        tableView.tableHeaderView = homeView
    }
    
  
    override func configureView() {
        super.configureView()
        view.addSubview(tableView)
    }
    
    override func configureConstraint() {
        super.configureConstraint()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CollectionViewCell.self, forCellReuseIdentifier: "CollectionViewCell")
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    override func configureTargets() {
        super.configureTargets()
    }

}

extension HomeVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableview = tableView.dequeueReusableCell(withIdentifier: "CollectionViewCell") as! CollectionViewCell
        return tableview
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    
}
