import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabController()
    }

    private func setupTabController() {
        tabBar.tintColor = Constants.tabBarTintColor
        tabBar.backgroundColor = Constants.tabBarBackgroundColor
        setupViewControllers()
        setupImages()
    }

    private func setupViewControllers() {
        let favouriteImagesViewController = FavouriteImagesViewController()
        favouriteImagesViewController.title = Constants.favouriteImagesVCTitle

        let imageDownloadViewController = ImageDownloadViewController()
        imageDownloadViewController.title = Constants.imageDownloadVCTitle

        setViewControllers(
            [
                UINavigationController(rootViewController: imageDownloadViewController),
                UINavigationController(rootViewController: favouriteImagesViewController)
            ],
            animated: false
        )
    }

    private func setupImages() {
        guard let items = tabBar.items else { return }

        let images = [Constants.personTitle, Constants.groupTitle]

        for (index, element) in images.enumerated() {
            items[index].image = UIImage(systemName: element)
        }
    }
}

private enum Constants {
    // Strings
    static let imageDownloadVCTitle = "Image Download"
    static let favouriteImagesVCTitle = "Favourite Images"
    static let personTitle = "person.fill"
    static let groupTitle = "person.3.fill"

    // Colors
    static let tabBarTintColor = UIColor.black
    static let tabBarBackgroundColor = UIColor.gray
}
