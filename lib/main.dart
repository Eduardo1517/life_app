import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life App',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(2, 255, 254, 1),
      ),
      home: MyHomePage(title: 'Life App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final drawerItems = [
    new DrawerItem("Inicio"),
    new DrawerItem("Servicios"),
    new DrawerItem("Primeros Auxilios"),
    new DrawerItem("Contactanos")
  ];

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color primaryColor = Color.fromRGBO(2, 255, 254, 1);
  int _selectedDrawerIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomePageView();
        break;
      case 1:
        return null;
        break;
      case 2:
        return null;
        break;
      case 3:
        return InfoPageView();
      break;
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              currentAccountPicture: new Image.asset('assets/ic_launcher.png'),
              accountName: new Text("Usuario Prueba",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.0,
                    fontFamily: "WorkSansSemiBold"),
              ),
              accountEmail: new Text('example@example.com'),
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () => launch('https://api.whatsapp.com/send?phone=595971960837'),
        tooltip: 'Increment',
        child: Icon(Icons.security,
        color:Colors.black,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class DrawerItem {
  String title;
  DrawerItem(this.title);
}

class HomePageView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // This expands the row element vertically because it's inside a column
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: new Image.asset('assets/mipmap_launcher.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            new Expanded(
              child: new Text("Bienvenidos\na Life App\nversión 1.0\nen desarrollo",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class InfoPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        padding: EdgeInsets.only(top: 0),
        child: Stack(
          alignment: Alignment.topCenter,
          overflow: Overflow.visible,
          children: <Widget>[
            Card(
              elevation: 2.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Container(
                width: 320.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Image.asset('assets/mipmap_launcher.png',
                      width: 110.0,
                      fit: BoxFit.cover,
                    ),
                    new Padding(padding: EdgeInsets.only(top: 15.0)),
                    new Text(
                      "Ayuda  de emergencia rápida\nal alcance de tus manos",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15.0,
                          fontFamily: "WorkSansSemiBold"),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 15.0, left: 15.0),
                      child: new ListTile(
                        onTap: () => launch('https://api.whatsapp.com/send?phone=595971960837'),
                        leading: new Icon(Icons.security),
                        title: new Text("WhatsApp",
                          style: TextStyle(
                              color: Color(0xFF4075df),
                              fontSize: 16.0,
                              fontFamily: "WorkSansSemiBold"),
                        ),
                        subtitle: new Text("Contacta con soporte técnico",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,
                              fontFamily: "WorkSansSemiBold"),
                        ),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 15.0, left: 15.0),
                      child: new ListTile(
                        onTap: () => launch('tel:595971960837'),
                        leading: new Icon(Icons.phone),
                        title: new Text("Telefono",
                          style: TextStyle(
                              color: Color(0xFF4075df),
                              fontSize: 16.0,
                              fontFamily: "WorkSansSemiBold"),
                        ),
                        subtitle: new Text("Contacta con soporte técnico via llamada",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,
                              fontFamily: "WorkSansSemiBold"),
                        ),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 15.0, left: 15.0),
                      child: new ListTile(
                        onTap: () => launch('mailto:example@example.com'),
                        leading: new Icon(Icons.mail),
                        title: new Text("Correo",
                          style: TextStyle(
                              color: Color(0xFF4075df),
                              fontSize: 16.0,
                              fontFamily: "WorkSansSemiBold"),
                        ),
                        subtitle: new Text("Contacta con soporte técnico via correo",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,
                              fontFamily: "WorkSansSemiBold"),
                        ),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 15.0, left: 15.0),
                      child: new ListTile(
                        onTap: () => launch('www.google.com'),
                        leading: new Icon(Icons.language),
                        title: new Text("Pagina Web",
                          style: TextStyle(
                              color: Color(0xFF4075df),
                              fontSize: 16.0,
                              fontFamily: "WorkSansSemiBold"),
                        ),
                        subtitle: new Text("Contacta con soporte técnico via web",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,
                              fontFamily: "WorkSansSemiBold"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
