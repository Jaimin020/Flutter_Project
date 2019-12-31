
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Post.dart';
import './Models/Post_Entry.dart';
import './login_page.dart';
import './sign_in.dart';
import './post_data.dart';
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
        title: Text("Edu_Talk",textDirection: TextDirection.ltr,),
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
      setState(() {
        x=_buildBody(context);
      });
      /*Navigator.push(context,
          MaterialPageRoute(builder: (context)=>postTab()));*/
    }
    if(index==1)
    {
      setState(() {

        x=postTab();
      });
      /*Navigator.push(context,
          MaterialPageRoute(builder: (context)=>postTab()));*/
    }
    if(index==2)
    {
      setState(() {
        x=null;
      });
      /*Navigator.push(context,
          MaterialPageRoute(builder: (context)=>postTab()));*/
    }
  }
}

/*class Post_List extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Post_List_State();
  }
}

class Post_List_State extends State<Post_List>
{
  StreamBuilder<QuerySnapshot> si=StreamBuilder<QuerySnapshot>(
  stream: Firestore.instance.collection('post').snapshots(),
  builder: (context, snapshot) {
  if (!snapshot.hasData) return LinearProgressIndicator();
  return _buildList(context, snapshot.data.documents);
  },
  );
  Entry ob=new Entry.Cos("Jaimin","Abc@Xyz",1234,"Please Help");
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.grey[300],
      child: ListView.builder(
        padding: EdgeInsets.all(2),
        itemBuilder: (BuildContext context,int index)
        {
          //if(index<1) {
            return buildRow(ob);
          //}
        },
      ),
    );
  }
}

/*class AddEntry
{
  AddEntry()
  {

  }
  static List<Entry> e=<Entry>[];
  static void addE(Entry ob) {
    e.add(ob);
  }
}*/

Widget buildRow(Entry ob) {
  return Container(
    padding: EdgeInsets.all(8),
    child: Card(
      child: Container(
        padding: EdgeInsets.all(6),
        child: Column(
          children: <Widget>[
            Text(ob.Ora_Name,textDirection: TextDirection.ltr,textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),),
            new Padding(padding: EdgeInsets.only(top: 6),),
            Text(ob.Email,textDirection: TextDirection.ltr,),
            new Padding(padding: EdgeInsets.only(top: 6),),
            Text(ob.Contanct.toString(),textDirection: TextDirection.ltr,),
            new Padding(padding: EdgeInsets.only(top: 6),),
            Text(ob.description,textDirection: TextDirection.ltr,
            style:TextStyle(
              fontWeight: FontWeight.w500
            )
              ),

          ],
        ),
      ),
    ),
  );
}*/

Widget _buildBody(BuildContext context) {
  if (email != null) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('post').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      },
    );
  } else {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const Text("You are not signed in.",
            style: TextStyle(
              fontSize: 24.0,
            )),
        RaisedButton(
          child: const Text(
            'SIGN IN',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    }
                )
            );
          },
        ),
      ],
    );
  }
}
List<Widget> list;
Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {

  return ListView.builder(
    padding: const EdgeInsets.only(top: 20.0),
    itemBuilder: (context, i) {
      // ignore: missing_return
      list = snapshot.map((data) => _buildListItem(context, data)).toList();
      if(list != null && i < list.length){
        var l = list[i];
        print("$i $l");
        return list[i];
      }
    },
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
  final record = Post.fromSnapshot(data);
  return Padding(
    key: ValueKey(record.title),
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        title: Text(record.title),
        subtitle: Text(record.description),
        trailing: Icon(
            Icons.delete
        ),
        onTap: () {
          record.reference.delete();
          list.remove(record);
          _buildBody(context);
        },
      ),
    ),
  );
}