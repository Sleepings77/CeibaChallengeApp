//
//  PostDetailViewController.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 24/08/2022.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {.lightContent}

    @IBOutlet private weak var nameLabel  : UILabel!
    @IBOutlet private weak var phoneLabel : UILabel!
    @IBOutlet private weak var emailLabel : UILabel!
    @IBOutlet private weak var tableView  : UITableView!
    @IBOutlet private weak var activityView   : UIView!
    @IBOutlet private weak var activityLoader : UIActivityIndicatorView!
    
    var user: User?
    private var viewModel = HomePostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.fetchUserPosts(with: user?.id ?? 0)
        bind()
    }
    
    private func setupView() {
        setupTableView()
        startIndicator()
        self.title = "Prueba de ingreso"
        nameLabel.text = user?.name
        phoneLabel.text = user?.phone
        emailLabel.text = user?.email
    }
    
    init(with user: User) {
        self.user = user
        super.init(nibName: "PostDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        viewModel.refreshUserPost = { [weak self] () in
            DispatchQueue.main.async {
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

extension PostDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier,
                                                       for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        cell.configure(with: viewModel.userPosts[indexPath.row])
        return cell
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostTableViewCell.getNib(),
                           forCellReuseIdentifier: PostTableViewCell.identifier)
    }
    
}
