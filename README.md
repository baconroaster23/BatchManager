# BatchManager

BatchManager is a lightweight package manager written entirely in Windows Batch. It provides a simple interface for discovering packages, managing installations, and extending functionality through plugins while keeping the project easy to understand and modify.

Unlike traditional package managers, BatchManager separates the application from its package repository. Package definitions are stored in an external GitHub repository, allowing new packages to be added without modifying the BatchManager source code.

---

## Features

- Package installation
- Package removal
- Package search
- Online package repository
- Local package database
- Plugin support
- Theme support
- Logging system
- Configurable settings
- Automatic repository synchronization

---

## Project Structure

```
BatchManager/
│
├── BatchManager.bat
├── config.ini
│
├── core/
│   ├── install.bat
│   ├── uninstall.bat
│   ├── update.bat
│   ├── search.bat
│   ├── launch.bat
│   ├── settings.bat
│   ├── plugins.bat
│   ├── logger.bat
│   ├── menu.bat
│   └── functions.bat
│
├── database/
│   ├── installed.txt
│   ├── packages.txt
│   └── packageinfo/
│
├── downloads/
├── cache/
├── logs/
├── plugins/
└── themes/
```

---

## Package Repository

BatchManager uses a separate package repository that contains every available package.

Repository structure:

```
batchpkgsini/
│
├── packages.txt
├── version.txt
│
└── packageinfo/
    ├── git.ini
    ├── python.ini
    ├── vscode.ini
    └── ...
```

Every package has its own definition file.

Example:

```ini
Name=Git
ID=git
Version=2.51.0
Author=Git Project
Description=Distributed version control system
Homepage=https://git-scm.com/
DownloadPage=https://git-scm.com/download/win
```

Adding a new package only requires:

1. Creating a new package definition.
2. Adding its identifier to `packages.txt`.
3. Publishing the changes to the repository.

No changes to BatchManager itself are required.

---

## Installation Process

When installing a package, BatchManager performs the following steps.

1. Downloads the latest package list.
2. Verifies that the requested package exists.
3. Downloads the corresponding package definition.
4. Displays package information.
5. Opens the official download page.
6. Stores the package definition locally.
7. Records the package in the local installation database.

Package definitions are cached locally after being downloaded.

---

## Package Definitions

Each package is described by an individual `.ini` file.

Example:

```ini
Name=Git
ID=git
Version=2.51.0
Author=Git Project
Description=Distributed version control system
Homepage=https://git-scm.com/
DownloadPage=https://git-scm.com/download/win
```

This format keeps package information independent from the application itself.

---

## Plugins

BatchManager supports plugins to extend its functionality without modifying the core project.

Plugins are ordinary Batch scripts stored inside the `plugins` directory.

```
plugins/
├── cleanup.bat
├── backup.bat
├── packagecreator.bat
└── systeminfo.bat
```

Every plugin found in this directory is automatically detected and displayed inside the Plugins menu.

Plugins may perform any task that can be accomplished with Batch scripting, including:

- Repository management
- Database maintenance
- Backup utilities
- System information
- Package creation
- Cache cleanup
- File management

Plugins execute independently from the core application, making them easy to develop, distribute and maintain.

---

## Creating Plugins

To create a plugin:

1. Create a new Batch script.
2. Save it inside the `plugins` directory.
3. Restart BatchManager.

The plugin will automatically appear in the Plugins menu.

No registration or installation process is required.

---

## Themes

Themes allow the appearance of BatchManager to be customized without modifying the source code.

Themes are stored inside the `themes` directory and may customize console colors, banners and user interface elements.

---

## Logging

BatchManager records application activity inside the `logs` directory.

Depending on configuration, the log may include:

- Package installations
- Package removals
- Repository updates
- Plugin execution
- Errors

---

## Configuration

Application settings are stored in `config.ini`.

Example:

```ini
Repository=https://raw.githubusercontent.com/USERNAME/batchpkgsini/main
Theme=Default
Logging=True
AutoUpdate=True
```

---

## Contributing

Contributions are welcome.

Areas where contributions are encouraged include:

- New package definitions
- Bug fixes
- Documentation improvements
- Themes
- Plugins
- Performance improvements
- Feature additions

Please ensure contributions follow the existing project structure and coding style.

---

## License

This project is licensed under the MIT License.
