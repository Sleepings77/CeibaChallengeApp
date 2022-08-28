//
//  HomeViewController.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 24/08/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {.lightContent}
    
    @IBOutlet private weak var searchText     : UITextField!
    @IBOutlet private weak var tableView      : UITableView!
    @IBOutlet private weak var activityView   : UIView!
    @IBOutlet private weak var activityLoader : UIActivityIndicatorView!
    
    private let viewModel = HomeViewModel()
    private var users: [User] = []
    private var filteredUsers: [User] = []
    private var EmptyCell: Int = 0
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backButtonTitle = ""
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        checkLocalData()
        bind()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.setHidesBackButton(false, animated: true)
    }
    
    private func checkLocalData() {
        let storeData: [User]? = UserDefaults.standard.retrieveCodable(for: "StoredUsers")

        if storeData?.count == 0 || storeData?.count == nil {
            viewModel.fetchUsers()
        } else {
            users = storeData ?? []
            stopIndicator()
        }
    }
    
    private func setupView() {
        title = "Prueba de Ingreso"
        startIndicator()
        setupTableView()
    }
    
    private func bind() {
        viewModel.refreshUserData = { [weak self] () in
            DispatchQueue.main.async {
                self?.users = self?.viewModel.users ?? []
                self?.tableView.reloadData()
                self?.stopIndicator()
            }
        }
    }
    
    private func startIndicator() {
        // The data load so fast that the animation show only for a 1 second or less , if i add a Dispatch timer in here will be a bad usage of this
        activityLoader.startAnimating()
    }
    
    private func stopIndicator() {
        activityLoader.stopAnimating()
        activityView.isHidden = true
    }
        
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BuildRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return BuildCell(tableView, indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if EmptyCell == 1 {
            return 60
        } else {
            return UITableView.automaticDimension
        }
    }
    
    private func setupTableView() {
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserDetailTableViewCell.getNib(),
                           forCellReuseIdentifier: UserDetailTableViewCell.identifier)
        tableView.register(EmptyTableViewCell.getNib(),
                           forCellReuseIdentifier: EmptyTableViewCell.identifier)
    }
    
}

extension HomeViewController {
    
    fileprivate func BuildRows() -> Int {
        if searchText.text?.count == 0 {
            return users.count
        } else {
            if filteredUsers.count == 0 {
                return 1
            } else {
                return filteredUsers.count
            }
        }
    }
    
    fileprivate func BuildCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier,
                                                           for: indexPath) as? UserDetailTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            
            if searchText.text?.count == 0 {
                cell.configure(with: users[indexPath.row])
            } else {
                if filteredUsers.count == 0 {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier,
                                                                   for: indexPath) as? EmptyTableViewCell else { return UITableViewCell() }
                    return cell
                } else {
                    cell.configure(with: filteredUsers[indexPath.row])
                }
            }
            return cell
    }
    
    @IBAction private func searchBarEditingChanged(_ sender: Any) {
        if searchText.text?.count != 0 {
            self.filteredUsers.removeAll()
            for user in users {
                let range = user.name?.lowercased().range(of: searchText.text ?? "", options: .caseInsensitive, range: nil, locale: nil)
                if range != nil {
                    self.filteredUsers.append(user)
                }
            }
        } else {
            EmptyCell = 0
            filteredUsers = []
        }
        tableView.reloadData()
    }
    
}

extension HomeViewController: PublicationTappedDelegate {
    
    func publicationTapped(with user: User) {
        let vc = PostDetailViewController(with: user)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
