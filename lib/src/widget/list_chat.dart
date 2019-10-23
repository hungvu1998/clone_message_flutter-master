import 'package:clone_message_flutter/src/bloc/auth_bloc.dart';
import 'package:clone_message_flutter/src/data/user_model.dart';
import 'package:clone_message_flutter/src/widget/profile_clipper.dart';
import 'package:clone_message_flutter/src/widget/story_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListChat extends StatefulWidget {
  @override
  _ListChatState createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Firestore.instance.collection('users').document('eSwNbGH4Wz7QoRwfipx')
        .get().then((DocumentSnapshot) {
      if (DocumentSnapshot.data == null) {
        print("object null");
        UserModel userModel = new UserModel(
            id:"eIwNbGH4Wz7QoRwfipx",
            name: "",
          idChat: [],
          isActive: false,
          imageAvatarUrl: "url"

        );
        AuthBloc().addDataUser(userModel.id,userModel.toJson());
      }
      else
        print(DocumentSnapshot.data.toString());
    }
    );
    return NotificationListener(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            _buildAppBarMessage(),
            _buildSearchBar(),
//            Container(
//              child: StreamBuilder(
//                stream: Firestore.instance.collection('users').where('id', isEqualTo: "50Ug1UI6ldfawFDNq4Tw").snapshots(),
//                builder: (context,snapshot){
//                  if(!snapshot.hasData){
//                    return Container(
//                          child: Center(
//                            child: CircularProgressIndicator(),
//                          ),
//                        );
//                  }
//                  else{
//                    return Container(
//                      child: ListView.builder(
//                        padding: EdgeInsets.all(10.0),
//                        itemBuilder: (context, index) => buildItem(context, snapshot.data.documents[index]),
//                        itemCount: snapshot.data.documents.length,
//                      ),
//                    );
//
//                  }
//                },
//              ),
//            )
//            _buildStoriesList(),
//            _buildListChat(),
          ],
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, DocumentSnapshot document) {
    if (document['id'] == "50Ug1UI6ldfawFDNq4Tw") {
      return Container();
    } else {
      return Container(
        margin: EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
      );
    }
  }


  _buildAppBarMessage(){
    return Padding(
      padding: EdgeInsets.only(
        top:40, left:16,right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                clipper: ProfileClipper(),
                child: Image.asset(
                  "assets/1.png",
                  width:45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Text("Chat",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200,
                  ),
                  child: Icon(
                    FontAwesomeIcons.camera,
                    size: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200,
                  ),
                  child: Icon(
                    FontAwesomeIcons.pen,
                    size: 18.0,
                  ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }

  _buildSearchBar(){
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0,top: 20.0),
      child:Container(
        height: 45.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: <Widget>[
            Container(width: 10.0,),
            Icon(Icons.search),
            Container(width: 8.0,),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search'
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildStoriesList(){
    return Container(
      height: 100,
      padding: EdgeInsets.only(top: 16.0),
      child: StoriesList(),
    );
  }

  _buildListChat(){

  }
}
