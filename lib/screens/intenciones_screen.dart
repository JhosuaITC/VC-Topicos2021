// ignore: unused_import
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:practica2/settings/color_settings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

class IntencionesScreen extends StatelessWidget {
  const IntencionesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = ImagePicker();
    String pathImage;

    return Scaffold(
      backgroundColor: ColorApp.secondaryBackColorApp,
      appBar: AppBar(
        backgroundColor: ColorApp.backPrimaryColorApp,
        title: Text("Intenciones"),
      ),
      body: ListView(
        children: [
          //Abrir una pagina web/ Llamada telefonica/ Enviar email / Mandar SMS/ Tomar Foto
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 10.0,
            child: ListTile(
              title: Text(
                "Abrir pagina web",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [Text("www.itcelaya.edu.mx"), Icon(Icons.touch_app)],
              ),
              leading: Container(
                height: 38,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.language),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.black))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                _OpenURL();
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 10.0,
            child: ListTile(
              title: Text(
                "Llamada Telefonica",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [Text("4619030133"), Icon(Icons.touch_app)],
              ),
              leading: Container(
                height: 38,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.phone),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.black))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                _MakeCallPhone();
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 10.0,
            child: ListTile(
              title: Text(
                "Enviar SMS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [Text("4619030133"), Icon(Icons.touch_app)],
              ),
              leading: Container(
                height: 38,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.message),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.black))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                _SendSMS();
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 10.0,
            child: ListTile(
              title: Text(
                "Enviar Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Text("19030133@itcelaya.edu.mx"),
                  Icon(Icons.touch_app)
                ],
              ),
              leading: Container(
                height: 38,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.mail),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.black))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                _SendEMAIL();
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 10.0,
            child: ListTile(
              title: Text(
                "Tomar Fotografia",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [Text("Smile"), Icon(Icons.touch_app)],
              ),
              leading: Container(
                height: 38,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.camera),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.black))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () => _OpenCamera(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _OpenURL() async {
    const url = 'https://www.itcelaya.edu.mx';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  Future<void> _MakeCallPhone() async {
    const tell = 'tel:4619030133';
    if (await launch(tell)) {
      await launch(tell);
    }
  }

  Future<void> _SendSMS() async {
    const tell = 'sms:4619030133';
    if (await canLaunch(tell)) {
      await launch(tell);
    }
  }

  Future<void> _SendEMAIL() async {
    final Uri params = Uri(
        scheme: 'Hola Mundo',
        path: 'jhosuasanchez01@gmail.com',
        query: 'subjet= Hola Mundo&body=Hola, buen dia :');

    var email = params.toString();
    if (await canLaunch(email)) {
      await launch(email);
    }
  }

  Future<void> _OpenCamera() async {
    /*final archivo = image.gtImage(source: CanvasImageSource.camera);
    pathImage = foto.path;*/
  }
}
