import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  int counter=1;
  Color pickedColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  List<Color> colorsList=[];
  incrementCounter(){
    this.counter=this.counter+1;
    notifyListeners();
  }

  setColor(Color c) {
    this.pickedColor = c;
    notifyListeners();
  }

 
  setCurrentColor(){
   this.currentColor=this.pickedColor;
   colorsList.add(this.currentColor);
   notifyListeners();

 }

 Widget getcolorsRow(){
   List<Container> cl=List();
   for(var i=0;i<colorsList.length;i++){
     cl.add(Container(width: 30,height: 30,color: colorsList[i],));
   }
   notifyListeners();
   return Row(children: cl,);
 }
 
  
}
