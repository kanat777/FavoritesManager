import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        thumbnailImageView.layer.cornerRadius = 8
        thumbnailImageView.clipsToBounds = true
    }

    func configure(with item: FavoriteItem) {
        thumbnailImageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
    }
}
