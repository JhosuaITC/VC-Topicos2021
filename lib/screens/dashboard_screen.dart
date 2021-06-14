import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2/settings/color_settings.dart';

import '../settings/color_settings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.secondaryBackColorApp,
        title: Text('Topicos Avanzados Jhosua'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://chingizpro.uz/img/person.png'),
                ),
                accountName: Text(
                  'Jhosua 117',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  '19030133@itcelaya.edu.mx',
                  style: TextStyle(color: Colors.black),
                )),
            ListTile(
              tileColor: ColorApp.backColorApp,
              leading: Icon(Icons.thermostat, color: Colors.white),
              title: Text('Conversor °C - °F',
                  style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.chevron_right, color: Colors.white),
              onTap: () {
                Navigator.pushNamed(context, '/conversor');
              },
            ),
            ListTile(
              tileColor: ColorApp.backColorApp,
              leading: Icon(Icons.phone, color: Colors.white),
              title: Text('Intenciones', style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.chevron_right, color: Colors.white),
              onTap: () {
                Navigator.pushNamed(context, '/intenciones');
              },
            ),
            ListTile(
              tileColor: ColorApp.backPrimaryColorApp,
              leading: Icon(
                Icons.web,
                color: Colors.white,
              ),
              title: Text('Exit', style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.chevron_right, color: Colors.white),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
