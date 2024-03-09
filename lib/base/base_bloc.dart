import 'dart:async';
import 'package:flutter/cupertino.dart';

import 'base_event.dart';

abstract class BaseBloc{
  final StreamController<BaseEvent> _eventStreamController = StreamController<BaseEvent>();

  // StreamController dung Sink de day event vao stream
  Sink<BaseEvent> get event => _eventStreamController.sink;

  BaseBloc(){
   _eventStreamController.stream.listen((event) {
     if(event is! BaseEvent){
       throw Exception("Event is not valid!");
     }
     dispatchEvent(event);
   });
  }

  void dispatchEvent(BaseEvent event);

  // Class extends bat buoc phai goi de dong controller
  @mustCallSuper
  void dispose(){
    _eventStreamController.close();
  }
}