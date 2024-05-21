import UIKit

class SongsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var album: Album?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = album?.title ?? "Songs"
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension SongsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album?.songs.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        if let song = album?.songs[indexPath.row] {
            cell.textLabel?.text = song.name
            cell.detailTextLabel?.text = song.duration
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SongsViewController: UITableViewDelegate {
}
