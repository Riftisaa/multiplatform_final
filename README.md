# Flutter Todo App with Clean Architecture

Aplikasi Todo List yang dibangun menggunakan Flutter dengan implementasi Clean Architecture dan Firebase sebagai backend.

## 🏗️ Arsitektur

Aplikasi ini menggunakan **Clean Architecture** yang terdiri dari 3 layer utama:

### 1. **Domain Layer** (`lib/domain/`)
- **Entities**: Model data murni tanpa dependency eksternal
  - `TodoEntity`: Representasi data todo
  - `UserEntity`: Representasi data user
- **Repositories**: Interface/kontrak untuk akses data
  - `TodoRepository`: Interface untuk operasi CRUD todo
  - `AuthRepository`: Interface untuk operasi autentikasi
- **Use Cases**: Business logic aplikasi
  - `GetTodos`: Mengambil daftar todo
  - `AddTodo`: Menambah todo baru
  - `UpdateTodo`: Mengupdate todo
  - `DeleteTodo`: Menghapus todo
  - `ToggleTodoStatus`: Mengubah status todo
  - `LoginUser`: Login user
  - `RegisterUser`: Register user baru

### 2. **Data Layer** (`lib/data/`)
- **Models**: Implementasi entity dengan tambahan method serialization
  - `TodoModel`: Extends TodoEntity dengan method toMap/fromMap
- **Datasources**: Akses data langsung ke sumber eksternal
  - `TodoRemoteDatasource`: Interaksi dengan Firebase Firestore
- **Repositories**: Implementasi interface dari domain layer
  - `TodoRepositoryImpl`: Implementasi TodoRepository
  - `AuthRepositoryImpl`: Implementasi AuthRepository

### 3. **Presentation Layer** (`lib/presentation/`)
- **Providers**: State management menggunakan Provider pattern
  - `TodoProvider`: Mengelola state todo list
  - `AuthProvider`: Mengelola state autentikasi
- **Pages**: UI halaman aplikasi
  - `LoginPage`: Halaman login
  - `RegisterPage`: Halaman register
  - `TodoListPage`: Halaman utama todo list
- **Widgets**: Komponen UI yang dapat digunakan ulang
  - `TodoItemWidget`: Widget untuk menampilkan item todo
  - `AddTodoDialog`: Dialog untuk menambah todo
  - `EditTodoDialog`: Dialog untuk mengedit todo

## 🚀 Fitur

- ✅ **Autentikasi**: Login dan Register dengan Firebase Auth
- ✅ **CRUD Todo**: Create, Read, Update, Delete todo items
- ✅ **Toggle Status**: Tandai todo sebagai completed/pending
- ✅ **Filter Todo**: Tab untuk All, Pending, dan Completed todos
- ✅ **Real-time Sync**: Data tersinkronisasi dengan Firebase Firestore
- ✅ **Error Handling**: Penanganan error yang user-friendly
- ✅ **Modern UI**: Interface yang clean dan responsive

## 🛠️ Teknologi yang Digunakan

- **Flutter**: Framework UI
- **Firebase Auth**: Autentikasi user
- **Cloud Firestore**: Database NoSQL
- **Provider**: State management
- **Clean Architecture**: Pola arsitektur

## 📱 Screenshots

### Login Page
- Form login dengan email dan password
- Error handling untuk kredensial yang salah
- Link ke halaman register

### Todo List Page
- Tab untuk filter todo (All, Pending, Completed)
- Floating action button untuk menambah todo
- Pull to refresh
- Logout button

### Todo Item
- Checkbox untuk toggle status
- Menu untuk edit dan delete
- Timestamp pembuatan
- Status badge (Pending/Completed)

## 🔧 Setup dan Instalasi

### Prerequisites
- Flutter SDK (>=3.6.2)
- Firebase project dengan Auth dan Firestore enabled
- Android Studio / VS Code

### Langkah Instalasi

1. **Clone repository**
   ```bash
   git clone <repository-url>
   cd multiplatform_final
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Setup Firebase**
   - Buat project Firebase baru
   - Enable Authentication (Email/Password)
   - Enable Cloud Firestore
   - Download `google-services.json` (Android) dan `GoogleService-Info.plist` (iOS)
   - Letakkan file konfigurasi di folder yang sesuai

4. **Generate Firebase options**
   ```bash
   flutter packages pub run build_runner build
   ```

5. **Run aplikasi**
   ```bash
   flutter run
   ```

## 📊 Struktur Database (Firestore)

### Collection: `todos`
```json
{
  "title": "string",
  "description": "string", 
  "isCompleted": "boolean",
  "createdAt": "timestamp",
  "userId": "string"
}
```

### Collection: `users` (handled by Firebase Auth)
- User data dikelola otomatis oleh Firebase Authentication

## 🎯 Cara Penggunaan

1. **Register/Login**: Buat akun baru atau login dengan akun existing
2. **Tambah Todo**: Tap tombol + untuk menambah todo baru
3. **Toggle Status**: Tap checkbox untuk menandai todo sebagai completed
4. **Edit Todo**: Tap menu (3 dots) → Edit untuk mengubah todo
5. **Delete Todo**: Tap menu (3 dots) → Delete untuk menghapus todo
6. **Filter Todo**: Gunakan tab untuk melihat All/Pending/Completed todos
7. **Logout**: Tap icon logout di app bar

## 🧪 Testing

Untuk menjalankan test:
```bash
flutter test
```

## 🤝 Kontribusi

1. Fork repository
2. Buat feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push ke branch (`git push origin feature/AmazingFeature`)
5. Buat Pull Request

## 📝 License

Distributed under the MIT License. See `LICENSE` for more information.

## 👨‍💻 Developer

Dibuat dengan ❤️ menggunakan Flutter dan Clean Architecture

---

**Note**: Pastikan untuk mengkonfigurasi Firebase dengan benar sebelum menjalankan aplikasi.
