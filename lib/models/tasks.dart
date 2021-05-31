class Tasks{
  String title;
  bool isDone;
  Tasks({this.title,this.isDone=false});

  String get _title => title;
  bool get _isDone => isDone;

  set Title(String newTitle) {
    if (newTitle.length <= 255) {
      this.title = newTitle;
    }
  }
  set Done(bool done) {

      this.isDone=done;

  }
  toggleDone(){
    isDone=!isDone;
  }
  Map<dynamic, dynamic> toMap() {

    var map = Map<String, dynamic>();

    map['title'] = title;
    map['isDone'] =isDone == true?1:0;

    return map;
  }
  Tasks.fromMapObject(Map<dynamic, dynamic> map) {

    this.title = map['title'];
    this.isDone=map['isDone']==1?true:false;

  }
}