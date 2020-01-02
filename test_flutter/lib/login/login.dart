import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _LoginPage();
  }
}

class _LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<_LoginPage> {
  void _toHome() {
    Navigator.pushNamed(context, '/Home', arguments: 'String~~~').then((data) {
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    //登录的name的controller，用于获取数据的
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: new Theme(
          data: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.copyWith(
                  title: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white),
                ),
          ),
          child: Builder(
            builder: (context) {
              return Text(
                '登录',
                style: Theme.of(context).textTheme.title,
              );
            },
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Hero(
                tag: 'login_header',
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset('images/chair-alpha.png'),
                  radius: 30,
                ),
              ),
              TextField(
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.blue,
                  fontStyle: FontStyle.normal,
                ),
                onChanged: (text) {
                  print('change $text');
                },
                controller: nameController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: '姓名:',
                ),
              ),
              TextField(
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.blue,
                  fontStyle: FontStyle.normal,
                ),
                onChanged: (text) {
                  print('change $text');
                },
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: '密码:',
                ),
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: _toHome,
                child: Text('login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
