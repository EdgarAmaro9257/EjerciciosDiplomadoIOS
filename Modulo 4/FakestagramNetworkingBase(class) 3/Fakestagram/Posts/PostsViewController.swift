//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import UIKit

class PostsViewController: UITableViewController {
    
    private var postsModel = PostsModel()
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        tabBarItem.image = UIImage(systemName: "text.viewfinder")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PostCell")
        navigationItem.title = "Posts"
        fetchPosts()
    }
    
    func fetchPosts() {
        guard let userID = Settings.user?.id else { return }
        postsModel.getPosts(userID: userID) { [weak self] error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.presentErrorAlert(title: "Error", message: error.localizedDescription)
                } else {
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

// MARK: - Delegate and data source methods
extension PostsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postsModel.getNumberOfPosts()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        if let post = postsModel.post(for: indexPath.row) {
            cell.textLabel?.text = post.title
            cell.detailTextLabel?.text = post.body
        }
        return cell
    }
}
