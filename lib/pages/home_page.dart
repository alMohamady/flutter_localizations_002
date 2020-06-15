import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlacalization002/models/language.dart';
import 'package:flutterlacalization002/routs/route_names.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawerList(),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton(
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>((lang) =>
                  DropdownMenuItem(
                    value: lang,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          lang.flag,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(lang.name)
                      ],
                    ),
                  )
              ).toList(),
              onChanged: (Language lang) {
                _changeLanguage(lang);
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20),
            child: _mainForm
              (
                context
            )
        ),
      ),
    );
  }

  Form _mainForm(BuildContext context) {
     return Form(
       key: _key,
       child: Column(
         children: <Widget>[
           Container(
             height: MediaQuery.of(context).size.height /4,
             child: Center(
               child: Text(
                 'Customer Information',
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold
                 ),
               ),
             ),
           ),
           TextFormField(
             validator: (val) {
               if (val.isEmpty){
                 return 'required field';
               }
               return null;
             },
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               labelText: 'Name',
               hintText: 'Enter Name'
             ),
           ),
           SizedBox(
             height: 10,
           ),
           TextFormField(
             validator: (val) {
               if (val.isEmpty){
                 return 'required field';
               }
               return null;
             },
             decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: 'Email',
                 hintText: 'Enter Email Address'
             ),
           ),
           SizedBox(
             height: 10,
           ),
           TextFormField(
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               labelText: 'Date',
               hintText: 'Select Date of Birth'
             ),
             onTap: () async {
               FocusScope.of(context).requestFocus(FocusNode());
               await showDatePicker(
                   context: context,
                   initialDate: DateTime.now(),
                   firstDate: DateTime(DateTime
                       .now()
                       .year),
                   lastDate: DateTime(DateTime
                       .now()
                       .year + 20)
               );
             },
           ),
           SizedBox(
             height: 10,
           ),
           MaterialButton(
             onPressed: () {
                if (_key.currentState.validate()) {
                   _showSuccessDialog();
                }
             },
             height: 50,
             shape: StadiumBorder(),
             color: Theme.of(context).primaryColor,
             child: Center(
               child: Text(
                 'Submit Information',
                 style: TextStyle(color: Colors.white, fontSize: 20),
               ),
             ),
           )
         ],
       )
     );
  }

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  Container _drawerList(){
    TextStyle _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24
    );
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: 100,
              child: CircleAvatar(),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              'About Us',
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              'Settings',
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
    );
  }

  void _changeLanguage(Language lang) {
    print (lang.languageCode);
  }
}
