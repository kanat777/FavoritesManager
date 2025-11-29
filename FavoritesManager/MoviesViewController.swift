import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var items: [FavoriteItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Movies"

        tableView.dataSource = self
        tableView.delegate = self

        tableView.rowHeight = 80
        tableView.estimatedRowHeight = 80
        tableView.delegate = self
        setupData()
    }

    private func setupData() {
        items = [
            FavoriteItem(
                title: "Inception",
                imageName: "movie1",
                description: "A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea in a CEO’s mind. The story jumps between layers of dreams and reality. You constantly question what is real and what is not.",
                review: "Обожаю сложный сюжет, атмосферу и музыку Ханса Циммера. Фильм каждый раз собирает мозг заново."
            ),
            FavoriteItem(
                title: "Interstellar",
                imageName: "movie2",
                description: "Earth is slowly becoming uninhabitable, and a group of astronauts travel through a wormhole in search of a new home for humanity. The story соединяет космос и очень личную линию отца и дочери. Временные парадоксы делают фильм ещё глубже.",
                review: "Фильм одновременно про науку и про любовь. После него долго сидишь в тишине и перевариваешь."
            ),
            FavoriteItem(
                title: "The Dark Knight",
                imageName: "movie3",
                description: "Batman faces the Joker, a chaotic criminal mastermind who pushes Gotham to the edge. Moral choices становятся всё жёстче. Герои постоянно балансируют между правильным и удобным.",
                review: "Лучший супергеройский фильм для меня. Джокер Хита Леджера — отдельный вид искусства."
            ),
            FavoriteItem(
                title: "The Matrix",
                imageName: "movie4",
                description: "A hacker named Neo discovers that the reality he knows is actually a simulation controlled by machines. Он должен решить, останется ли в комфортной иллюзии или примет правду. Фильм поднимает вопросы свободы и выбора.",
                review: "Очень люблю идею про «красную таблетку» и визуальный стиль. Классика, к которой хочется возвращаться."
            ),
            FavoriteItem(
                title: "La La Land",
                imageName: "movie5",
                description: "An aspiring actress and a jazz musician fall in love while pursuing their dreams in Los Angeles. Музыка, танцы и цветовое решение создают ощущение мюзикла-сказки. Но финал остаётся реалистичным и немного горьким.",
                review: "Фильм про мечты и цену, которую за них платишь. Саундтреки периодически слушаю отдельно."
            ),
            FavoriteItem(
                title: "Parasite",
                imageName: "movie1",
                description: "A poor family постепенно проникает в дом богатой семьи, выдавая себя за разных специалистов. Всё начинается как чёрная комедия, а заканчивается напряжённой драмой. Конфликт классов показан очень жестко.",
                review: "Люблю, насколько фильм многослойный — и про социальное неравенство, и про человеческую природу."
            ),
            FavoriteItem(
                title: "Coco",
                imageName: "movie2",
                description: "A young boy named Miguel попадает в мир мёртвых в поисках своего прадеда-музыканта. История связана с семейной памятью и традициями. Визуально мир выглядит ярко и очень уютно.",
                review: "Один из самых трогательных мультфильмов. Каждый раз на сцене с песней «Remember Me» появляются слёзы."
            ),
            FavoriteItem(
                title: "Fight Club",
                imageName: "movie3",
                description: "An office worker, страдающий от бессонницы, знакомится с харизматичным Тайлером Дёрденом и попадает в подпольный клуб. Постепенно реальность начинает расползаться. Финальный твист заставляет пересмотреть всё заново.",
                review: "Фильм про то, как мозг ищет выход из скучной жизни. Люблю диалоги и общую атмосферу безумия."
            ),
            FavoriteItem(
                title: "Forrest Gump",
                imageName: "movie4",
                description: "A man with a kind heart и простым взглядом на жизнь случайно оказывается в центре важных событий американской истории. Он любит, дружит и просто идёт вперёд. Через него показывается целая эпоха.",
                review: "Очень тёплый фильм, после которого веришь, что простота и доброта могут менять мир."
            ),
            FavoriteItem(
                title: "The Lord of the Rings: The Fellowship of the Ring",
                imageName: "movie5",
                description: "A young hobbit Frodo получает Кольцо Всевластья и отправляется в путь, чтобы уничтожить его в огне Мордора. Друзья-спутники представляют разные народы Средиземья. Это начало большого приключения и борьбы со злом.",
                review: "Обожаю мир Толкина, пейзажи, музыку и ощущение настоящего путешествия. Идеальный фильм для длинного вечера."
            )
        ]
    }

}

// MARK: - UITableViewDataSource
extension MoviesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "FavoriteCell",
            for: indexPath
        ) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }

        let item = items[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MoviesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovieDetail",
           let detailVC = segue.destination as? DetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            
            let item = items[indexPath.row]
            detailVC.item = item
        }
    }
}
