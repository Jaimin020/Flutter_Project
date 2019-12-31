import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Models/Post_Entry.dart';

class postTab extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return postTabState();
  }

}

class postTabState extends State<postTab>
{
  Entry ob=new Entry();
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      /*appBar: new AppBar(
        title: Text("Post",textDirection: TextDirection.ltr,),
        backgroundColor: Colors.deepOrange,
      ),*/

      body:new Container(
        color: Colors.grey[300],
        child: Center(
          child:new Card(
              color: Colors.white,
              margin: EdgeInsets.all(10.0),
              child: Form(
                  key: formkey,
                  child:Padding(
                    padding: EdgeInsets.all(15.0),
                    child: ListView(
                      children: <Widget>[
                        new TextFormField(
                          key:Key("Org"),
                          decoration: new InputDecoration(
                              hintText: 'XYZ pvt. lmt',
                              labelText: 'Organization Name'
                          ),
                          /*validator: this._validateEmail,*/
                      onSaved: (String value) {
                        debugPrint(value);
                        this.ob.Ora_Name = value;
                      }
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                          decoration: new InputDecoration(
                              hintText: 'abc@xyz.com',
                              labelText: 'Email'
                          ),
                          /*validator: this._validateEmail,*/
                      onSaved: (String value) {
                        this.ob.Email = value;
                      }
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.phone, // Use email input type for emails.
                          decoration: new InputDecoration(
                              hintText: '1234567898',
                              labelText: 'Contact Number',
                          ),
                          /*validator: this._validateEmail,*/
                      onSaved: (String value) {
                        this.ob.Contanct=int.parse(value);
                      }
                        ),
                        new Padding(padding: EdgeInsets.all(10.0)),
                        new TextFormField(
                          keyboardType: TextInputType.multiline, // Use email input type for emails.
                          maxLines: 7,
                          decoration: new InputDecoration(
                            hintText: 'Description',
                            hintStyle: TextStyle(),
                            labelText: 'Description',
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(
                                ),
                              )
                          ),
                          /*validator: this._validateEmail,*/
                      onSaved: (String value) {
                        this.ob.description = value;
                      }
                        ),
                        new Padding(padding: EdgeInsets.all(15.0)),
                        new RaisedButton(
                          color: Colors.deepOrange,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(8.0),
                          splashColor: Colors.red,
                          onPressed: () {
                            formkey.currentState.save();
                            Firestore.instance.collection('Post').document()
                                .setData({ 'Org_name': ob.Ora_Name, 'Email': ob.Email,'Cont':ob.Contanct,'Des':ob.description });
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )

                      ],
                    ),
                  )

              )
          ),
        ),
      ),
    );
  }
}