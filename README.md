# Geoloupix application

## Introduction

For our last year of high school, we have a project to realize in Computer Science. We chose to create a mobile application about geolocations, read more about it [here](https://github.com/geoloupix/specifications).

We finally decided to ship a Windows app as it's easier to work with and Flutter allows to do so really easily.

Mockups where made on [Figma](https://www.figma.com) for the mobile app, but it feats well on desktop too. [Open it](https://www.figma.com/file/g62AbHSWwl6h0pG915t3ZJ/Mockup) or check the embed below.

<iframe style="border: 1px solid rgba(0, 0, 0, 0.1);" width="800" height="450" src="https://www.figma.com/embed?embed_host=share&url=https%3A%2F%2Fwww.figma.com%2Ffile%2Fg62AbHSWwl6h0pG915t3ZJ%2FMockup" allowfullscreen></iframe>

## Technologies

For this project, we're using [Flutter](https://flutter.dev) `3.0.1`, a cross-platform [Dart](https://dart.dev/) powered framework. More details about the backend (API) [here](https://github.com/geoloupix/api).

## Using the app

App executable are available in the repository's releases section. [View latest](https://github.com/geoloupix/app/releases).

To use it, download the archive `Geoloupix-windows.zip`, unzip it and run the executable.

## Architecture

TODO

## Commands

### Release

```bash
$ git tag -a vX.Y.Z -m "Release vX.Y.Z"
$ git push --follow-tags
```
