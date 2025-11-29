import UIKit

class DetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var reviewTitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!

    // MARK: - Model
    var item: FavoriteItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        guard let item = item else { return }

        title = item.title         // заголовок в навбаре

        posterImageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
        descriptionTextView.text = item.description

        reviewTitleLabel.text = "My Thoughts"
        reviewLabel.text = item.review
    }
}

