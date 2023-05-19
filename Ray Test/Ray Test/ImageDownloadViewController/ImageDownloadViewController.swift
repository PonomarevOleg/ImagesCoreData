import UIKit

private enum Constants {
    // Strings
    static let defaultInput = "Default input"
}

class ImageDownloadViewController: UIViewController {
    //MARK: Variables
    private let photoModel = PhotoViewModel()
    
    //MARK: IBOutlets
    @IBOutlet weak private var searchTextField: UITextField!
    @IBOutlet weak private var imageView: UIImageView!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    //MARK: Private functions
    private func setup() {
        searchTextField.delegate = self
    }
    
    //MARK: IBActions
    @IBAction private func addToFavouritesButton(_ sender: Any) {
        
    }
    @IBAction private func getImageButton(_ sender: Any) {
        if searchTextField.text != "" {
            photoModel.downloadPhoto { [weak self] image in
                self?.imageView.image = image
            }
        }
    }
}
    //MARK: UITextFieldDelegate
extension ImageDownloadViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)

        switch textField.tag {
        case 0:
            photoModel.input = updatedString ?? Constants.defaultInput

        default:
            break
        }

        return true
    }
}
