# Geoloupix application

## Introduction

For our last year of high school, we have a project to realize in Computer Science. We chose to create a mobile application about geolocations, read more about it [here](https://github.com/geoloupix/specifications).

We finally decided to ship a Windows app as it's easier to work with and Flutter allows to do so really easily.

Mockups where made on [Figma](https://www.figma.com) for the mobile app, but it feats well on desktop too. [Open it](https://www.figma.com/file/g62AbHSWwl6h0pG915t3ZJ/Mockup) or check the embed below.

## Technologies

For this project, we're using [Flutter](https://flutter.dev) `3.0.1`, a cross-platform [Dart](https://dart.dev/) powered framework. More details about the backend (API) [here](https://github.com/geoloupix/api).

Having a look at [Dart language tour](https://dart.dev/guides/language/language-tour) is recommended to understand the code.

## Using the app

App executable are available in the repository's releases section. [View latest](https://github.com/geoloupix/app/releases).

To use it, download the archive `Geoloupix-windows.zip`, unzip it and run the executable.

## Code explanation

### Packages

All the code is located in the `/lib` folder, any other file/folder is for assets or configuration.

If you want to check the packages used for the project, you can open `/pubspec.yaml` and go to `https://pub.dev/packages/<package name>`, replacing `<package_name>` under `dependencies`.

**Example :**

```yaml
dependencies:
  flutter_map: ^0.14.0
```

Go to https://pub.dev/packages/flutter_map.

### Architecture

> Any mentionned files/folders are located in the `/lib` folder.

In Dart, the application entrypoint is the `main()` function located in `main.dart`.

The application uses a MVC (Model View Controller) architecture. The model is the data, the view is the UI and the controller is the logic. The code is not strictly organized like so but such things are stored in specific folders:

- Models are stored in `app/models`
- Views are stored in `screens` and `widgets`
- Controllers are stored in `app/controllers`

Code dedicated to more "global" logic is stored in `app/core`. For instance, it contains constants, global variables used across the app (such as `authController`), a custom router and key value store (KVS) storage interface on top of `flutter_secure_storage`. Several implementations here have been imported/adapted from previous work in [yNotes](https://github.com/EduWireApps/ynotes).

### Screens

Here is the availability of the screens:

- [x] /loading
- [x] /auth
- [x] /auth/login
- [x] /auth/register
- [x] /home
- [ ] /search
- [ ] /profile
- [ ] /notifications
- [x] /storage/:id
- [ ] /share
- [ ] /add

Even if the screens are available, many features are not available.

### Available features

Here is the list of the features available in the app:

- Login (and stay connected between sessions)
- Register
- Logout
- View markers on a map and interact with them (zoom)
- View markers and categories in a file explorer like interface (recursive)
- View profile details (username and email)

This is not a lot of features but we couldn't do much more with such time.

## Commands

### Release

```bash
$ git tag -a vX.Y.Z -m "Release vX.Y.Z"
$ git push --follow-tags
```
