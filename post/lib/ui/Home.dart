
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Post.dart';

class Home extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }

}
class HomeState extends State<Home>
{
  int si=0;
  Key k=new Key("sk");
  TextStyle ts=new TextStyle(
    fontSize: 18
  );
  var x;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: k,
      appBar: new AppBar(
        title: Text("{Appname}",textDirection: TextDirection.ltr,),
        backgroundColor: Colors.deepOrange,
      ),

      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            DrawerHeader(
              child: Text("{Username}",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.deepOrange[800]
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Login",textDirection: TextDirection.ltr,style: ts,),
              onTap: ()=>debugPrint("LoginTap"),
            ),
            ListTile(
              leading: Icon(Icons.group_add),
              title: Text("Register",textDirection: TextDirection.ltr,style: ts),
              onTap: ()=>debugPrint("RegisterTap"),
            ),
            ListTile(
              leading: Icon(Icons.alternate_email),
              title: Text("About",textDirection: TextDirection.ltr,style: ts),
              onTap: ()=>debugPrint("AboutnTap"),
            ),

          ],
        ),
      ),

      bottomNavigationBar: new BottomNavigationBar(items:
      const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home",textDirection: TextDirection.ltr)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_upload),
          title: Text("Post",textDirection: TextDirection.ltr),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text("Account",textDirection: TextDirection.ltr)
        )
      ],
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        onTap: _Tap,
        currentIndex: si,
      ),
      body: x,
    );
  }


  void _Tap(int index) {

    setState(() {
      si=index;
    });
    if(index==0)
    {
      x=null;
      /*Navigator.push(context,
          MaterialPageRoute(builder: (context)=>postTab()));*/
    }
    if(index==1)
    {
      x=postTab();
      /*Navigator.push(context,
          MaterialPageRoute(builder: (context)=>postTab()));*/
    }
    if(index==2)
    {
      x=null;
      /*Navigator.push(context,
          MaterialPageRoute(builder: (context)=>postTab()));*/
    }
  }
}

