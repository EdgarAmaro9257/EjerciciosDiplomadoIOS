import UIKit

class AlbumsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var band: Band?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = band?.name ?? "Albums"
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension AlbumsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return band?.albums.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath)
        if let album = band?.albums[indexPath.section] {
            cell.textLabel?.text = album.title
            cell.detailTextLabel?.text = album.releaseYear
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return band?.albums[section].title
    }
}

// MARK: - UITableViewDelegate
extension AlbumsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let songsViewController = storyboard.instantiateViewController(withIdentifier: "SongsViewController") as? SongsViewController {
                    navigationController?.pushViewController(songsViewController, animated: true)
            songsViewController.album = band?.albums[indexPath.section]
        }
    }
}

