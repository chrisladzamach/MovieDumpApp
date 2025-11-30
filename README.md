# MovieDump - Flutter App

## EN: English Version

### Overview
MovieDump is a Flutter mobile application that allows users to manage and evaluate movies based on customizable criteria. Users can add movies, assign scores to different evaluation criteria, add notes, and optionally attach images. The app uses Hive for local data persistence, ensuring that all movie data is saved locally and retrieved automatically.

### Features
- Add new movies with custom titles.
- Add evaluation criteria dynamically.
- Assign scores to each criterion.
- Add optional notes and images for each movie.
- View the list of movies with their average scores.
- Delete movies from the list.
- Data is persisted locally using Hive, so it remains after app restarts.
- Intuitive UI with visual hints for first-time users.

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/chrisladzamach/MovieDumpApp.git
   ```
2. Navigate to the project folder:
   ```bash
   cd moviedump
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Initialize Hive adapters and open boxes (done automatically in `main.dart`).
5. Run the app:
   ```bash
   flutter run
   ```

### Dependencies
- `flutter` ≥ 3.0.0
- `hive` & `hive_flutter` for local data storage
- `path_provider` for Hive initialization
- Other dependencies: standard Flutter SDK widgets

### Folder Structure
```
lib/
├── app/
│   └── routes.dart
├── core/
│   └── constants/
├── data/
│   ├── models/
│   │   ├── hive/
│   │   │   ├── movie_hive.dart
│   │   │   └── evaluation_criteria_hive.dart
│   │   └── ...
│   └── sample/
├── features/
│   └── movie_list/
│       ├── movie_list_screen.dart
│       ├── add_movie_screen.dart
│       └── widgets/
└── main.dart
```

### Usage
- Tap the **+** button to add a new movie.
- Enter a title, optional notes, and add evaluation criteria.
- Save the movie; it will appear in the main list with calculated average score.
- Tap the delete button to remove a movie.

---

## ES: Versión en Español

### Resumen
MovieDump es una aplicación móvil desarrollada en Flutter que permite a los usuarios gestionar y evaluar películas según criterios personalizables. Los usuarios pueden agregar películas, asignar puntuaciones a diferentes criterios de evaluación, añadir notas y opcionalmente imágenes. La app utiliza Hive para el almacenamiento local, asegurando que todos los datos se guarden y se recuperen automáticamente.

### Funcionalidades
- Agregar nuevas películas con títulos personalizados.
- Añadir criterios de evaluación de manera dinámica.
- Asignar puntuaciones a cada criterio.
- Agregar notas e imágenes opcionales a cada película.
- Visualizar la lista de películas con su puntuación promedio.
- Eliminar películas de la lista.
- Los datos se almacenan localmente usando Hive, permaneciendo después de reiniciar la app.
- Interfaz intuitiva con señales visuales para usuarios nuevos.

### Instalación
1. Clonar el repositorio:
   ```bash
   git clone https://github.com/chrisladzamach/MovieDumpApp.git
   ```
2. Ir a la carpeta del proyecto:
   ```bash
   cd moviedump
   ```
3. Instalar dependencias:
   ```bash
   flutter pub get
   ```
4. Inicializar los adapters y cajas de Hive (se hace automáticamente en `main.dart`).
5. Ejecutar la app:
   ```bash
   flutter run
   ```

### Dependencias
- `flutter` ≥ 3.0.0
- `hive` & `hive_flutter` para almacenamiento local
- `path_provider` para la inicialización de Hive
- Otras dependencias: widgets estándar de Flutter

### Estructura de carpetas
```
lib/
├── app/
│   └── routes.dart
├── core/
│   └── constants/
├── data/
│   ├── models/
│   │   ├── hive/
│   │   │   ├── movie_hive.dart
│   │   │   └── evaluation_criteria_hive.dart
│   │   └── ...
│   └── sample/
├── features/
│   └── movie_list/
│       ├── movie_list_screen.dart
│       ├── add_movie_screen.dart
│       └── widgets/
└── main.dart
```

### Uso
- Pulsa el botón **+** para agregar una nueva película.
- Ingresa un título, notas opcionales y añade criterios de evaluación.
- Guarda la película; aparecerá en la lista principal con el puntaje promedio calculado.
- Pulsa el botón de eliminar para borrar una película.

