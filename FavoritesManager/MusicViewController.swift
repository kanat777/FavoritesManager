import UIKit

class MusicViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var items: [FavoriteItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Music"

        setupData()

        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupData() {
        items = [
            FavoriteItem(
                title: "Random Access Memories – Daft Punk",
                imageName: "album1",
                description: "Альбом, в котором Daft Punk ушли от чистой электроники и сделали ставку на живые инструменты. Много фанка, диско и очень тёплого звука. Практически каждая композиция звучит как отдельная история.",
                review: "Любимый альбом для долгих поездок и работы. Включаю и просто вхожу в поток."
            ),
            FavoriteItem(
                title: "Divide – Ed Sheeran",
                imageName: "album2",
                description: "Сочетание лиричных баллад и бодрых поп-треков, которые легко запоминаются. В альбоме много личных историй, рассказанных простым языком. Хорошо заходит как фон на каждый день.",
                review: "Этот альбом ассоциируется с уютом и тёплыми вечерами. Лайтовая музыка, которая не надоедает."
            ),
            FavoriteItem(
                title: "After Hours – The Weeknd",
                imageName: "album3",
                description: "Мрачный, атмосферный поп с элементами синтвейва. Темы одиночества, сожаления и саморазрушения. Звук плотный, кинематографичный, с мощными басами и запоминающимися мелодиями.",
                review: "Слушаю, когда хочется кинематографичного настроения. Прям саундтрек к ночному городу."
            ),
            FavoriteItem(
                title: "Future Nostalgia – Dua Lipa",
                imageName: "album4",
                description: "Современная поп-музыка с сильным влиянием диско и 80-х. Очень танцевальные треки, продакшн чистый и яркий. Альбом поднимает настроение буквально с первых секунд.",
                review: "Идеальный плейлист, чтобы собираться на выход или навести порядок дома под танцы."
            ),
            FavoriteItem(
                title: "folklore – Taylor Swift",
                imageName: "album5",
                description: "Тихий, камерный альбом, полный историй и образов. Меньше попа, больше инди и акустики. Тексты очень образные и киношные, много деталей и эмоций.",
                review: "Включаю, когда нужно замедлиться и побыть в своих мыслях. Особенно люблю слушать в наушниках."
            ),
            FavoriteItem(
                title: "21 – Adele",
                imageName: "album1",
                description: "Сильные вокальные партии, душевные баллады и песни о расставании, которые стали классикой. Музыка проста по аранжировке, но очень сильна по эмоциям.",
                review: "Адель — это всегда про выброс эмоций. Иногда нужно просто попеть вместе с ней."
            ),
            FavoriteItem(
                title: "Discovery – Daft Punk",
                imageName: "album2",
                description: "Яркий электронный альбом с узнаваемыми риффами и сэмплами. Многие треки стали культовыми и до сих пор звучат современно. Микс ностальгии и футуризма.",
                review: "Классика, которая всегда поднимает настроение. Идеален для фоновой музыки днём."
            ),
            FavoriteItem(
                title: "WHEN WE ALL FALL ASLEEP, WHERE DO WE GO? – Billie Eilish",
                imageName: "album3",
                description: "Необычный минималистичный продакшн, шёпотный вокал и очень атмосферное звучание. Альбом экспериментальный, но при этом цепляющий. Много деталей в аранжировках.",
                review: "Слушаю, когда хочется чего-то нестандартного. Очень вдохновляет по звуку."
            ),
            FavoriteItem(
                title: "X – Ed Sheeran",
                imageName: "album4",
                description: "Сочетание акустики, попа и элементов хип-хопа. Много треков, которые стали хитами, но при этом альбом цельный. Чувствуется живая энергия.",
                review: "Подходит и для фона, и чтобы подпевать. Несколько песен у меня в плейлисте годами."
            ),
            FavoriteItem(
                title: "A Head Full of Dreams – Coldplay",
                imageName: "album5",
                description: "Яркий, светлый альбом с позитивным звучанием. Много красочных аранжировок, хоров и синтезаторов. Музыка про надежду, свет и движение вперёд.",
                review: "Ставлю, когда нужно добавить света и оптимизма. Очень тёплый по настроению альбом."
            )
        ]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMusicDetail",
           let detailVC = segue.destination as? DetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            detailVC.item = items[indexPath.row]
        }
    }
}

// MARK: - TableView

extension MusicViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "FavoriteTableViewCell",
            for: indexPath
        ) as! FavoriteTableViewCell

        let item = items[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}

extension MusicViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

