# Note Application

A simple and fast Flutter application for creating and managing tasks/notes.  
Users can create, edit, delete, and store their notes locally using Hive for persistent offline storage.

---

## 🚀 Features

- Add new tasks/notes  
- Edit existing tasks  
- Delete tasks  
- Store all data locally with Hive  
- Custom checkbox using `msh_checkbox`  
- Time picker integration using `time_pickerr`

---

## 🛠️ Tech Stack

**Framework:**  
- Flutter

**Local Storage:**  
- Hive  
- Hive Flutter  
- Hive Generator (for model adapters)

**UI Packages:**  
- msh_checkbox  
- time_pickerr  
- cupertino_icons

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  msh_checkbox: ^2.0.1
  time_pickerr: ^1.0.6
  cupertino_icons: ^1.0.8

dev_dependencies:
  flutter_test:
    sdk: flutter
  hive_generator: ^2.0.1
  build_runner: ^2.5.4
▶️ How to Run

Clone the repository:

git clone https://github.com/cyrus4u/note.git


Install all packages:

flutter pub get


Generate Hive type adapters (if needed):

flutter pub run build_runner build


Run the app:

flutter run
📸 Screenshots

![Home Screen](images/add.png)
![Home Screen](images/edit.png)
![Home Screen](images/homePage.png)

👤 Author

GitHub: cyrus4u
