import UIKit

class CoursesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var items: [FavoriteItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Courses"

        setupData()

        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupData() {
        items = [
            FavoriteItem(
                title: "iOS Development Basics",
                imageName: "course1",
                description: "Курс, который знакомит с основами UIKit, Storyboard, Auto Layout и работе с Xcode. После него становится понятно, как вообще устроены мобильные приложения.",
                review: "Именно после такого формата уроков появляется уверенность, что можно сделать своё приложение."
            ),
            FavoriteItem(
                title: "Swift Programming",
                imageName: "course2",
                description: "Глубокое погружение в язык Swift: типы, функции, протоколы, структуры и классы. Много практических задач и примеров.",
                review: "Помог системно разложить язык по полочкам и перестать бояться синтаксиса."
            ),
            FavoriteItem(
                title: "UI/UX Design Fundamentals",
                imageName: "course3",
                description: "Базовый курс по дизайну интерфейсов: типографика, сетки, цвета, работа с Figma. Учит смотреть на приложение глазами пользователя.",
                review: "После курса стала иначе смотреть на экраны — начала замечать отступы, иерархию и логику."
            ),
            FavoriteItem(
                title: "Algorithms & Data Structures",
                imageName: "course4",
                description: "Курс по базовым алгоритмам: списки, стеки, очереди, сортировки и деревья. Даёт фундамент для более сложных тем и собеседований.",
                review: "Не всегда легко, но зато очень прокачивает мозг и логическое мышление."
            ),
            FavoriteItem(
                title: "Git & GitHub",
                imageName: "course5",
                description: "Практический курс по работе с Git: коммиты, ветки, pull request’ы, работа с удалёнными репозиториями. Всё на примерах реальных проектов.",
                review: "После курса работа с Git стала гораздо спокойнее — меньше страха что-то сломать."
            ),
            FavoriteItem(
                title: "Intro to Machine Learning",
                imageName: "course1",
                description: "Обзорный курс по основам машинного обучения: типы моделей, обучение, метрики качества. Даёт представление, как работают современные ML-системы.",
                review: "Круто, что объясняют простым языком, без лишней математики на старте."
            ),
            FavoriteItem(
                title: "Web Development Basics",
                imageName: "course2",
                description: "HTML, CSS и базовый JavaScript. Курс показывает, как устроены сайты, и позволяет быстро собрать свои первые страницы.",
                review: "Полезная база, чтобы понимать фронтенд и лучше общаться с веб-разработчиками."
            ),
            FavoriteItem(
                title: "Databases & SQL",
                imageName: "course3",
                description: "Основы реляционных баз данных: таблицы, связи, запросы SELECT/INSERT/UPDATE/DELETE. Практика на простых примерах.",
                review: "После курса запросы в SQL уже не кажутся чем-то страшным и непонятным."
            ),
            FavoriteItem(
                title: "Project Management Essentials",
                imageName: "course4",
                description: "Курс про планирование задач, таймлайн, приоритизацию и работу с командой. Помогает лучше организовывать учебные и рабочие проекты.",
                review: "Сильно помогает в жизни: теперь проще разбивать большие цели на понятные шаги."
            ),
            FavoriteItem(
                title: "Soft Skills for Developers",
                imageName: "course5",
                description: "Коммуникация, фидбек, презентации и работа в команде. Курс показывает, что у разработчика важны не только технические навыки.",
                review: "Полезное напоминание, что умение общаться и объяснять — такой же навык, как кодить."
            )
        ]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCourseDetail",
           let detailVC = segue.destination as? DetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            detailVC.item = items[indexPath.row]
        }
    }
}

// MARK: - TableView

extension CoursesViewController: UITableViewDataSource {

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

extension CoursesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

