import Foundation
import UIKit
import CoreData

class PhotoViewModel {
    var input = ""
    private var context = CoreDataManager.shared.persistentContainer.viewContext
    
    func downloadPhoto(completion: @escaping (UIImage) -> ()) {
        guard let url = URL(string: "https://dummyimage.com/500x500&text=" + input)
        else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else  { return }
            let photo = Photo(context: self.context)
            photo.title = self.input
            photo.content = UIImage(data: data)
            try? self.context.save()
            guard let image = photo.content else { return }
            DispatchQueue.main.async {
                completion(image)
            }
        }
        .resume()
    }
}
