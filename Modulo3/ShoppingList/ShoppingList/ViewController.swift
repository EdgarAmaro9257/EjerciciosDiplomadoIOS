import UIKit

class ViewController: UIViewController {
    
    // Conexión para el UITextField
    @IBOutlet weak var TextField: UITextField! {
        didSet {
            // Establece una vista accesoria personalizada (toolBar) para el campo de texto
            TextField.inputAccessoryView = toolBar
        }
    }
    
    // Conexión para el UITableView
    @IBOutlet weak var tableView: UITableView!
    
    // Array para almacenar los elementos de la lista de compras
    var shoppingList = ["Limones", "Huevos", "Café"]
    
    // viewDidLoad se llama después de que la vista del controlador se ha cargado en memoria
    override func viewDidLoad() {
        super.viewDidLoad()
        // Establecer el dataSource y delegate del tableView a self
        tableView.dataSource = self
        tableView.delegate = self
        // Registrar una celda personalizada nib con el tableView
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    // Instanciación perezosa de la UIToolbar utilizada como vista accesoria para el TextField
    lazy var toolBar: UIToolbar = {
        let tool: UIToolbar = .init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        tool.barStyle = .default
        tool.isTranslucent = false
        tool.tintColor = .blue
        tool.sizeToFit()
        
        // Crear items de espacio flexible y botón de "Done"
        let spaceArea: UIBarButtonItem = .init(systemItem: .flexibleSpace)
        let doneButton: UIBarButtonItem = .init(title: "Done", style: .done, target: self, action: #selector(dismissKeyboard))
        
        // Establecer los items de la toolbar
        tool.setItems([spaceArea, doneButton], animated: false)
        tool.isUserInteractionEnabled = true
        return tool
    }()
    
    // Función para ocultar el teclado
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Acción para agregar un nuevo elemento a la lista de compras
    @IBAction func addButton(_ sender: Any) {
        // Agregar el texto del TextField al array shoppingList
        shoppingList.append(TextField.text ?? "")
        // Recargar el tableView para reflejar el nuevo elemento
        tableView.reloadData()
    }
}

// Extensión para conformar el protocolo UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    // Retornar el número de secciones en el tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Retornar el título para el encabezado en la sección especificada
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Lista de Compras 🛒"
    }
    
    // Retornar el número de filas en la sección especificada
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    // Configurar y retornar la celda para el indexPath especificado
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Desencolar una celda reutilizable con el identificador "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell
        // Establecer el texto de la etiqueta de la celda al elemento correspondiente en el array shoppingList
        cell?.CellTextLabel.text = shoppingList[indexPath.row]
        return cell!
    }
}

// Extensión para conformar el protocolo UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    // Retornar la altura de las filas en el indexPath especificado
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 70 : 50
    }
    
    // Manejar la selección de filas
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Placeholder para la acción al seleccionar una fila
    }
    
    // Manejar la eliminación de filas
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Crear una alerta para confirmar la eliminación
            let alertController = UIAlertController(title: "¿Estás seguro de eliminar: " + shoppingList[indexPath.row] + "?", message: nil, preferredStyle: .alert)
            
            // Crear acciones de confirmar y descartar para la alerta
            let confirmAction = UIAlertAction(title: "Confirmar", style: .default) { _ in
                self.shoppingList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            let dismissAction = UIAlertAction(title: "Volver", style: .destructive)
            
            // Agregar acciones al controlador de alerta y presentarlo
            alertController.addAction(confirmAction)
            alertController.addAction(dismissAction)
            present(alertController, animated: true)
        }
    }
}

// Extensión para conformar el protocolo UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    // Placeholder para métodos adicionales del delegado de UITextField
}
