import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:try_project/providers/colorProvider.dart';

void main() {
  runApp(ChangeNotifierProvider<ColorProvider>(
    create: (context) => ColorProvider(),
    child: MaterialApp(
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    ColorProvider colorprovider =
        Provider.of<ColorProvider>(context);
    Row r = colorprovider.getcolorsRow();
    return Scaffold(
      appBar: AppBar(
        title: Text('Try ColorPicker'),
      ),
      body: Container(
        height: 400,
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('Choose Color'),
                onPressed: () {
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: colorprovider.pickedColor,
                          onColorChanged: colorprovider.setColor,
                          showLabel: true,
                          pickerAreaHeightPercent: 0.8,
                          
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('Got it'),
                          onPressed: () {
                            colorprovider.setCurrentColor();
                            r = colorprovider.getcolorsRow();
                            Navigator.of(context).pop();
                            print(colorprovider.currentColor);
                            print(r.children);
                          },
                        ),
                      ],
                    ),
                  );
                }),
            //MyContainer(),
            
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  return Container(
                    width: 30,
                    height: 30,
                    color: colorprovider.currentColor,
                  );
                })
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatefulWidget {
  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  Color t = Color(0xff158697);

  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider =
        Provider.of<ColorProvider>(context, listen: false);

    setState(() {
      t = colorProvider.currentColor;
    });

    return Container(
      width: 30,
      height: 30,
      color: t,
    );
    /* GestureDetector(
      onTap: () {
        t = colorProvider.currentColor;
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        color: t,
      ),
    ); */
  }
}
