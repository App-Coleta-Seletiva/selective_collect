# Selective Collection

## Project's General View 

### Engineer:

- Architecture
  - Clean Architecture [(Flutterando)](https://github.com/Flutterando/Clean-Dart)
  - SOLID
  	
- State Management 
 - [BLoC](https://pub.dev/packages/flutter_bloc)
 - [Injection e Routes Modular](https://pub.dev/packages/flutter_modular)

- Build Tools	
  - [GitAction](https://github.com/features/actions)

### Back-end:
   - FirebaseAuth
   - Hasura 
   - Database with Postgres


## Project's Guide Lines

### Nomenclature

- **Folders and Files:** `snake_case`
- **Classes:** `PascalCase`
- **Variables, functions e methods:** `camelCase`
- **Interfaces:** begin with a `I`, e.g. `I`Controller
- **Implementation:** end with a `Impl`, e.g. Controller`Impl`
- **Sufix:** what it is, e.g. home`_page`/home`_bloc`/Home`Page` 
- **Naming Reactivity:** end with what it is, e.g. home`_bloc`/home`_state`

### Parameters Definition

Following the [Clean Architecture proposed by Flutterando](https://github.com/Flutterando/Clean-Dart#clean-dart-1) we obtain 5 layers. For each one was defined how to use paramters.

- **PRESENTER:**
    - *Reactivity:* Named
    - *Controller:* Named (Facade Design Pattern)?
    - *UI:* Named  
- **DOMAIN:** Positional
- **INFRA**: Positional
- **EXTERNAL:** Named

For every layer the rule below must be applied:
- **A sequence of parameters used in more than one place must be part of a `class`**

### Theme

- A `class` for the general theme 
- Get the Theme from the `context`
- `Package`implementation for the Design System's Widgets

### Assets

- Located at the root of the project
- Folder structure: images, fonts, ícons
- Organization in Code:
    - A `class` of Assets with constants

### Git and Github
- Commits: 
    - [feat, fix, doc, etc.](https://www.conventionalcommits.org/pt-br/v1.0.0/)
    - [Gitmoji](https://gitmoji.dev/)
    - Examples:

        ```
        :sparkles: feat: allow provided config object to extend other configs

        :boom: BREAKING CHANGE: `extends` key in config file is now used for extending other config files

        :memo: docs: correct spelling of CHANGELOG
        ```
- Branchs:
    - function/name: feat/home_controller
    - Fundamental Branchs:
        - `prod`: final user (CD - Continuous Deployment)
        - `stage`: client test
        - `dev`: develop and tests (CI - Continuous Implementation)


