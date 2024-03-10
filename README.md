# todolist7

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Analys App
## main.dart
  - contain MyHomePage() extends StatelessWidget
  - child:
  - ---------MyHomePage (main.dart)
  - ------------------- MateriaApp
  - -------------------+ title: name of app
  - -------------------+ theme: theme outline app
  - -------------------+ home: chứa Provider(để cung cấp đối tượng TodoBloc - chứa các dữ liệu và các hàm thao tác dữ liệu)
  - ------------------------ Scaffold
  - ------------------------+ appBar: AppBar
  - ---------------------------------+ backgroundColors: colors of bar(Header)
  - ---------------------------------+ title: a text in left of bar
  - ------------------------+ body: Provider<>
  - --------------------------------+ value: TodoBloc() as data to be provided
  - --------------------------------+ child: TodoListContainer() is Widget receive data
## todo_list_container.dart
  - contain TodoListContainer() extends StatelessWidget
  - children[]
  - ----------+ TodoHeader:
  - ----------+ TodoList:















  
