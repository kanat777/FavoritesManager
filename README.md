# Favorites Manager App

UIKit-based iOS application that manages user favorites across four categories:
**Movies**, **Music**, **Books**, and **Courses**.  
The app uses a `UITabBarController` with table views and detailed screens for each item.

---

## Features

- 4 tabs:
  - 🎬 **Movies**
  - 🎵 **Music**
  - 📚 **Books**
  - 🎓 **Courses**
- Each tab shows a table view with at least 10 items.
- Custom table view cell with:
  - 60x60 thumbnail image
  - Title label
- Detail screen for each item with:
  - Large image (poster / cover)
  - Big title
  - Multi-line description
  - "My Thoughts" / personal review section

---

## Architecture

- `UITabBarController` as the root controller
- Each tab embedded in its own `UINavigationController`
- Separate view controllers:
  - `MoviesViewController`
  - `MusicViewController`
  - `BooksViewController`
  - `CoursesViewController`
- Shared model:
  - `FavoriteItem` (title, imageName, description, review)
- Shared cell:
  - `FavoriteTableViewCell` (thumbnail + title)
- Detail screen:
  - `DetailViewController` (image, title, description, review)

---

## Screens (examples)

- Tab bar with 4 tabs
- Movies list
- Movie detail screen
- Music list
- Optional: Books detail, Courses list

(Attach screenshots in the report / LMS as required by the assignment.)

---

## Requirements

- Xcode 15+ (or compatible)
- iOS 15.0+ deployment target
- Swift
- UIKit + Storyboard

---

## How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/FavoritesManager.git
