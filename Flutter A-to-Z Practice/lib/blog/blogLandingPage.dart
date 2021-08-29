
import 'package:fluter_a_to_z/db/blogModel.dart';
import 'package:fluter_a_to_z/db/dbManager.dart';
import 'package:fluter_a_to_z/profile/userProfileInfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'postData.dart';

class BlogLandingPage extends StatefulWidget {
  @override
  _BlogLandingPageState createState() => _BlogLandingPageState();
}

class _BlogLandingPageState extends State<BlogLandingPage> {

  TextEditingController blogController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blogs"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.account_circle), onPressed: (){
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => UserProfileInof()));
           // Navigator.pushNamed(context, MaterialPageRoute(builder: (BuildContext context) => BlogLandingPage()));
          }),
          IconButton(icon: Icon(Icons.power_settings_new), onPressed: (){}),
        ],
      ),
      //body: BlogList(),
      body: FutureBuilder<List<PostData>>(
        future: fetchPostData(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemBuilder: (context, position){
                 
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Icon(Icons.chat)),
                        title: Text(snapshot.data[position].name),
                        subtitle: Text(snapshot.data[position].description),
                        trailing: Icon(Icons.favorite,color: Colors.red,),
                      ),
                    );               
              }

            );
          }
        }
      ),
      
      floatingActionButton: FloatingActionButton(onPressed: () => openNewBlogWindow(), child: Icon(Icons.chat),),
    );
  }

  Widget openNewBlogWindow() {
    print("openNewBlogWindow() is called...");
    //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => NewBlogBody()));
     showDialog(
      context: context,
      builder: (BuildContext context){
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            title: Row( children: <Widget>[
              Text("What's In Your Mind", textAlign: TextAlign.center,),
              Icon(Icons.lightbulb_outline)
            ],),
            content: showBlogContent(),
            actions: <Widget>[
              Divider(height: 2.0, color: Colors.orange,),
              Padding(
                padding: EdgeInsets.only( right:70.0),
                child: showBlogActionBtns(),
              )
              
              ],
          );
      }
    );

  }// openNewBlogWindow()
  Widget BlogList(){
    
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index){
        return 
        Card(
              child: ListTile(   
                leading: CircleAvatar(child: Icon(Icons.chat)),               
                title: Text("items"+'${[index]}'),
              ),
        );
      }
    );
  }
  Future<List<PostData>> fetchPostData() async {
      var response= await http.get('https://flutter.smarttersstudio.com/test/getAllPosts.php?id=116');
      List<PostData> data = postDataFromJson(response.body);
      return data;
  }  

showBlogContent(){
    return TextFormField(
      minLines: 10,
      maxLines: 20,
      controller: blogController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "What's In Your Mind"
      ),
    );
  }

  showBlogActionBtns(){
    return Row(
      children: <Widget>[
        IconButton(icon: Icon(Icons.check_circle), iconSize: 40.0,
        color: Colors.orangeAccent, onPressed: () => saveBlog()),
        IconButton(icon: Icon(Icons.cancel), iconSize: 40.0,
        color: Colors.lightGreenAccent, onPressed: (){
          Navigator.of(context).pop();
        }),
      ],
    );
  }

  saveBlog() async{
    print("saveBlog() is called ...");
    if(blogController.text != null && blogController.text.length > 0){
      Blog blogObj = new Blog();
      blogObj.name = "Biswa";
      blogObj.blogContent = blogController.value.text.toString();
      blogObj.createdAt = new DateTime.now().toIso8601String();
      print(blogObj.toString());
      var status = await DBManager.dbManager.addBlog(blogObj);
      print("Blog Creation status -->"+status.toString());
      blogController.text = null;
    }
   Navigator.of(context).pop();
  }

}