# FLUTTER START
## _My Documentation Windows 10_

[![N|Micode](https://cldup.com/dTxpPi9lDf.thumb.png)](http://micodee.epizy.com/?i=1)


## Start With VSCode
    
- Open VSCode

    - CTRL + SHIFT + P | Flutter: New Project | appliaction | pilih folder untuk penyimpanan | nama project
    
- with CMD
   -  ```sh
        flutter create (nama_project)
        ```
    - cd (nama_project)
    
    - flutter run
    
- get depedencies like `go mod tidy` or `npm i`

    ```sh
    flutter pub get
    ```
    
## Create Page

- Page Home

    - create folder `pages` & file `main_home_page.dart` in `lib`
    
        ```sh
        import 'package:flutter/material.dart';
        ```
        
        ketik `stles` muncul `Flutter Stateless Widget` kemudian enter
        
        ```sh
        class MyWidget extends StatelessWidget {
          const MyWidget({super.key});
        
          @override
          Widget build(BuildContext context) {
            return const Placeholder();
          }
        }
        ```
        
- `main.dart`
    
    - ```sh
        import 'package:flutter/material.dart';
        import 'package:flutter/services.dart';
        import 'package:flutter_ecommerce/pages/main_home_page.dart';
        
        void main() {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
          ));
          runApp(const MyApp());
        }
        
        class MyApp extends StatelessWidget {
          const MyApp({super.key});
        
          // This widget is the root of your application.
          @override
          Widget build(BuildContext context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const MainHomePage(),
            );
          }
        }
        ```
        
- add asset
 
    - edit file `pubspec.yaml`
    
        ```sh
          # assets:
          #   - images/a_dot_burr.jpeg
          #   - images/a_dot_ham.jpeg
        ```
        
        change to
        
        ```sh
          assets:
           - assets/images
           - assets/icons
        ```
        
## Shortcut VSCode

- Stless (Flutter Staless Widget)