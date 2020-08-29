import 'package:flutter/material.dart';
//import 'package:sample/register.dart';

void main() => runApp(
      MaterialApp(
          title: 'login page',
          home: LoginForm(),
          theme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.lightBlueAccent,
              accentColor: Colors.blueAccent)),
    );

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _minimumPadding = 5.0;

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _name;
  String _email;
  String _password;
  String _phone;

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      performLogin();
    }
  }

  void performLogin() {
    final snackbar = new SnackBar(
      content: new Text(
          "Email :$_email , Password : $_password , Name: $_name , Phone:$_phone"),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Form(
        key: formKey,
        child: Container(
          margin: EdgeInsets.all(_minimumPadding * 2),
          child: ListView(
            children: [
              getImageAssets(),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextFormField(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_box),
                          labelText: 'Name',
                          hintText: 'Enter your Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                      validator: (String name) {
                        if (name.isEmpty)
                          return 'Invalid name';
                        else
                          return null;
                      })),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextFormField(
                    onSaved: (val) => _email = val,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'E-mail',
                      hintText: 'Enter your E-mail',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    validator: (val) =>
                        !val.contains('@') ? 'Invalid Email' : null,
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextFormField(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.call),
                          labelText: 'Phone',
                          hintText: 'Enter Number',
                          prefixText: '+91',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                      validator: (String number) {
                        if (number.length != 10)
                          return 'Invalid Number';
                        else
                          return null;
                      })),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextFormField(
                      onSaved: (val) => _password = val,
                      obscureText: true,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          hintText: 'Enter Number your password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                      validator: (String password) {
                        if (password.length < 6)
                          return "Your password is too short";
                        else
                          return null;
                      })),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: RaisedButton(
                  onPressed: _submit,
                  //   FocusScope.of(context).requestFocus(FocusNode());

                  //   if (formKey.currentState.validate()) {}

                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) {
                  //     return Details();
                  //   }));
                  // },
                  child: Text('Submit'),
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("If user have an accont?"),
                SizedBox(width: 10.0),
                InkWell(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget getImageAssets() {
    AssetImage assetImage = AssetImage('assets/images/1530933253957.jpg');
    Image image = Image(image: assetImage, width: 120.0, height: 120.0);
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }
}
