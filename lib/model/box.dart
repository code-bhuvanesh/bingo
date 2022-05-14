class Box{
  final int _id;
  bool _pressed = false;
  Box({required int id}): _id = id;

  int get id{
    return _id;
  }

  bool get pressed{
    return _pressed;
  }

  bool changePressed(){
    if(!_pressed) _pressed = true;
    print("pressed");
    return _pressed;
  }

}