# Fitgoals Solution

### 🧑‍💻 Tech Stack

1. Front-end/Mobile: Flutter
2. Back-end: Golang (Fiber)
3. Database: MongoDB
4. Storage: MinIO

### ⚡ How to run this project

#### Front-end (Flutter)

1. [Install Flutter](https://docs.flutter.dev/get-started/install)

2. Open Emulators

```sh
# List all emulators
flutter emulators
# Run an emulator
flutter emulators --launch [emulator_id]
```

3. Run Flutter

```sh
# Change directory to Front-end project
cd ./fe
# Install dependencies
flutter pub get
# Run Flutter
flutter run
```

#### Back-end (Go Fiber)

1. [Install Docker](https://www.docker.com/products/docker-desktop/)

2. Run Docker Compose

```sh
docker compose up
```

### 🚀 How to Deploy this Project

#### Build Android App

1. Build `apk` package

```sh
# Clean project
flutter clean
# Install dependencies
flutter pub get
# Build apk
flutter build apk
```

#### Deploy Backend Server
