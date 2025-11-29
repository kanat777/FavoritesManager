import UIKit

class BooksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var items: [FavoriteItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Books"

        setupData()

        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupData() {
        items = [
            FavoriteItem(
                title: "Atomic Habits – James Clear",
                imageName: "book1",
                description: "Книга про маленькие ежедневные шаги, которые постепенно меняют жизнь. Автор объясняет, как формируются привычки и как с ними работать. Много практических примеров и понятных моделей.",
                review: "Очень прикладная книга. После неё реально начинаешь менять маленькие вещи в быту."
            ),
            FavoriteItem(
                title: "Deep Work – Cal Newport",
                imageName: "book2",
                description: "Книга о том, как сосредотачиваться и работать без отвлечений в мире, полном нотификаций. Автор делится стратегиями, как создать условия для глубокой концентрации.",
                review: "Помогла по-другому взглянуть на рабочее время и убрать лишний шум."
            ),
            FavoriteItem(
                title: "The 7 Habits of Highly Effective People – Stephen Covey",
                imageName: "book3",
                description: "Классическая книга по личной эффективности. Кови предлагает набор принципов, которые помогают выстроить жизнь осознанно. Много внимания ценностям и долгосрочному мышлению.",
                review: "Тяжеловата, но очень фундаментальная. К ней хочется возвращаться периодически."
            ),
            FavoriteItem(
                title: "Mindset – Carol Dweck",
                imageName: "book4",
                description: "Книга о фиксированном и гибком мышлении. Автор показывает, как наши установки влияют на успех, мотивацию и обучение. Примеры из спорта, бизнеса и образования.",
                review: "Хорошо объясняет, почему важно смотреть на ошибки как на возможность учиться."
            ),
            FavoriteItem(
                title: "Ikigai",
                imageName: "book5",
                description: "Исследование японской концепции смысла жизни и долголетия. Авторы изучают привычки людей, которые живут долго и остаются активными. Много мягких, вдохновляющих идей.",
                review: "Книга-напоминание замедляться и находить маленькие радости в обычном дне."
            ),
            FavoriteItem(
                title: "Start With Why – Simon Sinek",
                imageName: "book1",
                description: "Книга о том, как важна внутренняя причина во всём, что мы делаем. Через истории компаний и лидеров автор показывает, почему «зачем» важнее, чем «что».",
                review: "Помогает лучше сформулировать свои мотивы и ценности в бизнесе."
            ),
            FavoriteItem(
                title: "Essentialism – Greg McKeown",
                imageName: "book2",
                description: "Книга о том, как отсекать лишнее и фокусироваться на самом важном. Автор предлагает осознанно выбирать, куда вкладывать время и энергию.",
                review: "Очень откликнулась тема «делать меньше, но лучше». Полезно перечитывать."
            ),
            FavoriteItem(
                title: "The Subtle Art of Not Giving a F*ck – Mark Manson",
                imageName: "book3",
                description: "Несерьёзным языком о серьёзных вещах: ограничения, ответственность, ценности. Автор ломает популярные позитивные клише и предлагает смотреть на жизнь трезво.",
                review: "Нравится прямота и юмор. Книга хорошо встряхивает ожидания и установки."
            ),
            FavoriteItem(
                title: "Can't Hurt Me – David Goggins",
                imageName: "book4",
                description: "История человека, который через дисциплину и жёсткую работу вышел из сложных условий и стал ультрамарафонцем и мотивирующим спикером.",
                review: "Очень мощная книга про внутреннюю силу и выносливость. Читается на одном дыхании."
            ),
            FavoriteItem(
                title: "The Alchemist – Paulo Coelho",
                imageName: "book5",
                description: "Простая притча о пастухе Сантьяго, который отправляется в путь за своей мечтой. Книга про знаки, путь и веру в своё предназначение.",
                review: "Лёгкая по форме, но глубокая по смыслу. Хорошо перечитывать в моменты поиска направления."
            )
        ]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBookDetail",
           let detailVC = segue.destination as? DetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            detailVC.item = items[indexPath.row]
        }
    }
}

// MARK: - TableView

extension BooksViewController: UITableViewDataSource {

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

extension BooksViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

