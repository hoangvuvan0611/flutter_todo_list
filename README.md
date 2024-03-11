# TODOLIST7

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Todo directory
### main.dart
  - contain MyHomePage() extends StatelessWidget
  - child:
  - ---------MyHomePage (main.dart)
  - ------------------- MateriaApp
  - -------------------+ title: name of app
  - -------------------+ theme: theme outline app
  - -------------------+ home: chứa Provider(để cung cấp đối tượng TodoBloc - chứa các dữ liệu và các hàm thao tác dữ liệu) - document: (Creates a value, store it, and expose it to its descendants.)
  - ------------------------ Scaffold
  - ------------------------+ appBar: AppBar
  - ---------------------------------+ backgroundColors: colors of bar(Header)
  - ---------------------------------+ title: a text in left of bar
  - ------------------------+ body: Provider<>
  - --------------------------------+ value: TodoBloc() as data to be provided
  - --------------------------------+ child: TodoListContainer() is Widget receive data
### todo_list_container.dart
  - contain TodoListContainer() extends StatelessWidget
  - children[]
  - ----------+ TodoHeader:
  - ----------------------+ TextEditingController(): Creates a controller for an editable text field.
  - ----------------------+ Provider.of<TodoBloc>: Lấy [Provider<T>] gần nhất trong cây widget của nó và trả về giá trị của nó.(Obtains the nearest [Provider<T>] up its widget tree and returns its value.)
  - ------------------------: trong TodoHeader: provider lấy TodoBloc(), gọi các hàm của nó để lấy giá trị nhập từ màn hình
  - ----------+ TodoList:
  - --------------------+ didChangeDependencies() method được sử dụng để gọi hàm init cho todoList
  - --------------------+ build() return Consumer() - là một widget được sử dụng để lắng nghe(listen), tiêu thụ(consumed), receive(nhận) dữ liệu từ Provider
  - ----------------------------+ StreamBuilder(): receive a stream todos

## base directory
### base_event
  -  contain BaseEvent object
### base_bloc.dart
  - chứa thuộc tính eventStream co kiểu StreamController, quản lý luồng stream dữ liệu đưa vào.
  - event method là dạng hàm get có kiểu Sink để đưa dữ liệu vào stream
  - Trong hàm constructor của BaseBloc nó sẽ đẩy dữ liệu đi thông qua một class extend
  -----+ khi một event được tạo thì một BaseBloc cũng được tạo, hàm constructor sẽ đẩy data đó vào Sink<BaseEvent> để truyền đi

## bloc diẻctory
  - TodoBloc extend BaseBloc
  - chứa thuộc tính todoListStream có liểu StreamController<List<Todo>>
  - BaseBloc có một thuộc tính có kiểu StreamController<BaseEvent> còn TodoBloc có kiểu StreamController<List<Todo>> là vì:
  - --------+ Trong BaseBloc, stream chỉ chứa một todo hay event được nhập vào từ người dùng
  - --------+ Trong TodoBloc, stream chứa list các todo
  - --------+ get method thuộc tính đó sẽ trả về luồng list<Todo>















  
