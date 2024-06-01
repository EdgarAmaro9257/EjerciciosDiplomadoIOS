import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    
    @IBOutlet weak var tablePokelist: UITableView!
    
    var pokeShapeList = [PokeShape]()
    var filteredShapesPoke = [PokeShape]()
    let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        initList()
        initSearchController()
        NotificationCenter.default.addObserver(self, selector: #selector(favoritesUpdated), name: NSNotification.Name(rawValue: "FavoritesUpdated"), object: nil)
        
    }
    deinit {
         // Remover el observador al salir de la vista para evitar fugas de memoria
         NotificationCenter.default.removeObserver(self)
     }
    @objc func favoritesUpdated() {
         // Actualizar la tabla cuando se recibe la notificación de actualización de favoritos
         tablePokelist.reloadData()
     }
    func initSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        definesPresentationContext = true
        tablePokelist.tableHeaderView = searchController.searchBar

        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["Numero","Nombre"]
        searchController.searchBar.delegate = self
        
    }
    func initList() {
        let Balbassaur = PokeShape(id:"001", name: "Bulbasaur", imageName: "Bulbasaur")
                pokeShapeList.append(Balbassaur)
                let Charmander = PokeShape(id:"004", name: "Charmander", imageName: "Charmander")
                pokeShapeList.append(Charmander)
                let Squirtle = PokeShape(id:"007", name: "Squirtle", imageName: "squirtle")
                pokeShapeList.append(Squirtle)
                let Weedle = PokeShape(id: "013", name: "Weedle", imageName: "weedle")
                pokeShapeList.append(Weedle)
                let Ekans = PokeShape(id:"023", name: "Ekans", imageName: "ekans")
                pokeShapeList.append(Ekans)
                let Pikachu = PokeShape(id:"025", name: "Pikachu", imageName: "pikachu")
                pokeShapeList.append(Pikachu)
                let Nidoran_girl = PokeShape(id:"029", name: "Nidoran♀", imageName: "nidoranF")
                pokeShapeList.append(Nidoran_girl)
                let Nidoran_boy = PokeShape(id:"032", name: "Nidoran♂", imageName: "nidoranM")
                pokeShapeList.append(Nidoran_boy)
                let Cyndaquil = PokeShape(id:"037", name: "Vulpix", imageName: "vulpix")
                pokeShapeList.append(Cyndaquil)
                let Zubat = PokeShape(id:"041", name: "Zubat", imageName: "zubat")
                pokeShapeList.append(Zubat)
                let Oddish = PokeShape(id:"043", name: "Oddish", imageName: "oddish")
                pokeShapeList.append(Oddish)
                let Psyduck = PokeShape(id:"054", name: "Psyduck", imageName: "psyduck")
                pokeShapeList.append(Psyduck)
                let Growlithe = PokeShape(id:"058", name: "Growlithe", imageName: "growlithe")
                pokeShapeList.append(Growlithe)
                let Bellsprout = PokeShape(id:"069", name: "Bellsprout", imageName: "bellsprout")
                pokeShapeList.append(Bellsprout)
                let Ponyta = PokeShape(id:"077", name: "Ponyta", imageName: "ponyta")
                pokeShapeList.append(Ponyta)
                let Magnemite = PokeShape(id:"081", name: "Magnemite", imageName: "magnemite")
                pokeShapeList.append(Magnemite)
                let Grimer = PokeShape(id:"088", name: "Grimer", imageName: "grimer")
                pokeShapeList.append(Grimer)
                let Shellder = PokeShape(id:"090", name: "Shellder", imageName: "shellder")
                pokeShapeList.append(Shellder)
                let Exeggcute = PokeShape(id:"102", name: "Exeggcute", imageName: "exeggcute")
                pokeShapeList.append(Exeggcute)
                let Koffing = PokeShape(id:"109", name: "Koffing", imageName: "koffing")
                pokeShapeList.append(Koffing)
                let Zapdos = PokeShape(id:"145", name: "Zapdos", imageName: "zapdos")
                pokeShapeList.append(Zapdos)
                
                let Piplup = PokeShape(id:"150", name: "Mewtwo", imageName: "p")
                pokeShapeList.append(Piplup)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchController.isActive){
            return filteredShapesPoke.count
        }
        return pokeShapeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCelllID") as! TableViewCell
                let thisShape: PokeShape!

                if searchController.isActive {
                    thisShape = filteredShapesPoke[indexPath.row]
                } else {
                    thisShape = pokeShapeList[indexPath.row]
                }

                tableViewCell.nombrepoke.text = thisShape.id + " " + thisShape.name
                tableViewCell.imagepoke.image = UIImage(named: thisShape.imageName)

                // Configura el botón de favoritos según el estado del elemento
              

                         // Configura el manejador de eventos para el  .touchUpInside)

                         return tableViewCell
    }
    @objc func favoriteButtonTapped(_ sender: UIButton) {
         let selectedIndex = sender.tag

         // Obtiene el elemento seleccionado
         var selectedShape: PokeShape

         if searchController.isActive {
             selectedShape = filteredShapesPoke[selectedIndex]
         } else {
             selectedShape = pokeShapeList[selectedIndex]
         }

         // Cambia el estado de favorito
         selectedShape.isFavorite.toggle()

         // Actualiza la tabla
         tablePokelist.reloadData()

         // Agrega o quita el elemento de la lista de favoritos en DataManager
         if selectedShape.isFavorite {
             DataManager.shared.favoriteItems.append(selectedShape)
         } else {
             DataManager.shared.favoriteItems.removeAll { $0.id == selectedShape.id }
         }

         // Guarda la lista de favoritos en UserDefaults
         DataManager.shared.saveFavorites()
     }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        
        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }
    func filterForSearchTextAndScopeButton(searchText: String, scopeButton: String = "Todo") {
        print("Search Text: \(searchText), Scope Button: \(scopeButton)")

        // Utiliza pokeShapeList en lugar de DataManager.shared.favoriteItems
        filteredShapesPoke = pokeShapeList.filter { shape in
            let searchTextMatch: Bool
            if scopeButton == "Numero" {
                // Filtrar por número
                searchTextMatch = shape.id.lowercased().starts(with: searchText.lowercased())
            } else {
                // Filtrar por nombre
                searchTextMatch = shape.name.lowercased().starts(with: searchText.lowercased())
                print(searchTextMatch)
            }

            return searchTextMatch
        }

        tablePokelist.reloadData()
    }



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = self.tablePokelist.indexPathForSelectedRow {
                let tableViewDetail = segue.destination as? TableViewDetail
                let selectedShape : PokeShape!
                if(searchController.isActive){
                    selectedShape = filteredShapesPoke[indexPath.row]
                }else{
                    selectedShape = pokeShapeList[indexPath.row]
                }
                
                
                tableViewDetail!.selectedShapPoke = selectedShape
                self.tablePokelist.deselectRow(at: indexPath, animated: true)
            }
        }
    }
}

