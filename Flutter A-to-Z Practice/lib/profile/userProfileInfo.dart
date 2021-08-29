import 'package:fluter_a_to_z/db/blogModel.dart';
import 'package:fluter_a_to_z/db/dbManager.dart';
import 'package:fluter_a_to_z/utils/imageViewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class UserProfileInof extends StatefulWidget {
  @override
  _UserProfileInofState createState() => _UserProfileInofState();
}

class _UserProfileInofState extends State<UserProfileInof> {
  GlobalKey _scaffoldKey = new GlobalKey();
  bool isPotrait = true;
  var userFeedback = "";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text("Profile Info"),
            bottom: TabBar(tabs: [
              Icon(Icons.face),
              Icon(Icons.school),
              Icon(Icons.work),
              Icon(Icons.supervised_user_circle),
              Icon(Icons.chat_bubble)
            ]),
          ),
          body: TabBarView(children: [
            profileInfoTab_1(),
            educationInfo_2(),
            professionalInfo_3(),
            myFollowingList_4(),
            myBlogs_5()
          ]),
        ));
  }

  Widget profileInfoTab_1() {
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Center(child: Text("Personal Info",style: TextStyle(fontWeight: FontWeight.bold),)),
          GestureDetector(onTap: () => showImageView(),
          child: Card(//RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Image.asset("assets/images/brs_thumbnail.jpg",height: 70.0,width:70.0),
          ),
          ),
          Card(child: Text("Name: BiswaRanjan Samal")),
          Card(child: Text("DOB: 15th June 1990")),
          Card(child: Text("Age: 30")),
          Card(child: Text("Gender: Male")),
          Card(child: Text("Blood Group: B+")),
          Card(child: Text("Fathers Name: Bishikeshan Samal")),
          Card(child: Text("Mothers Name: Basanti Samal")),
          Center(child: Text(
            userFeedback == ""? "": userFeedback == "1" ? "Thanks To Like My Picture.":"Ops! Thanks For Your Feedback."
            ,style: TextStyle(fontWeight: FontWeight.bold),)),

          // ListView(
          //   scrollDirection: Axis.horizontal,
          //   children: <Widget>[
          //     GestureDetector(
          //       child:Card(
          //         child: Image.asset("assets/images/brs_thumbnail.jpg",height: 70.0,width:70.0),
          //       ),
          //      // onTap: showImageView(),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }

 showImageView() async{
   print("showImageView() is called ---------->");
   var result;
   result = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ImageViewer()));
   print("userFeedback -->$result");
   setState(() {
     userFeedback = result;
   });
 }
  Widget professionalInfo_3(){
    return Card(
      child: Column(
        children: <Widget>[
          Center(child: Text("Professional Info", style: TextStyle(fontWeight: FontWeight.bold),)),
          Card(child: Text("Software Engineer, Silicon Tech Lab {2013 - 2015}")),
          Card(child: Text("Tech Lead, Acesocloud {2015 - Present}")),
          Center(child: Text("Skills",style: TextStyle(fontWeight: FontWeight.bold),)),
          // GridView.count(
          //   crossAxisCount: 3,
          //   children: <Widget>[
          //     Card(child: Text("C"),),
          //     Card(child: Text("C++"),),
          //     Card(child: Text("C#"),),
          //     Card(child: Text("Java"),),
          //     Card(child: Text("Python"),),
          //     Card(child: Text("PHP"),),
          //   ],
          // )
        
        ],
        
      ),
    );
  }

  Widget educationInfo_2(){
    return Card(
      child: Column(
        children: <Widget>[
          Center(child: Text("Education Info", style: TextStyle(fontWeight: FontWeight.bold),)),
          Card(child: Text("10th from Capital High Schoool")),
          Card(child: Text("I.Sc. from Achrya Harihara Mahavidyalaya")),
          Card(child: Text("B.Sc. from B.R.S College")),
          Card(child: Text("MCA from Silicon Institute of Technology")),
          Card(child: Text("M.Tech in CSE fron Utkal University")),
          Card(child: Text("Ph.D Scholar in P.G Dept. of CSA Utkal University"))
        ],
      ),
    );
  }
Widget myFollowingList_4(){
  final List<String> frndNames = ["Nandinee", "Sangeeta","Anil", "Pratikhsya", "Guluri", "Prasad"];
  return ListView.builder(
    itemCount: frndNames.length,
    itemBuilder: (context, index){
      return Dismissible(
        key: Key(frndNames[index]),
        child: ListTile(
          title: Text(frndNames[index] ),
        ),
        onDismissed: (direction){
            final sncakBar = new SnackBar(content: Container(child: Text("${frndNames[index]} removed succesfully."),));
            Scaffold.of(context).showSnackBar(sncakBar);               
          setState(() {
            frndNames.removeAt(index);            
             //_scaffoldKey.currentState.showSnackBar(snackBar);
          });     
        },
        background: Container(color: Colors.red),        
      );
    }
  );
}

 myBlogs_5() async{
   print("myBlogs_5 -->");
   
  // List<Blog> blogList = await DBManager.dbManager.getBlogs();
  // blogList.forEach((element) { 
  //   print("element -->"+element.blogContent);
  // });
  
  // return ListView.builder(
  //   itemCount: blogList.length,
  //   itemBuilder: (context, index){
  //     return ListTile(
  //       leading: Text(blogList[index].name),
  //     );
  //   }
  // );
}


}
