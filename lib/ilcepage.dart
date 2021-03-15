import 'package:flutter/material.dart';
import 'package:nobetcieczane/models/eczane.dart';
import 'package:nobetcieczane/services/api.dart';
import 'package:nobetcieczane/models/ilce.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'eczanepage.dart';

class IlcePage extends StatelessWidget {
  final String cityName;

  const IlcePage({Key key, this.cityName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        title: Text(this.cityName),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Services.getIlce(this.cityName),
        builder: (context, AsyncSnapshot<Ilce> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.result.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EczanePage(
                              il: this.cityName,
                              ilce: snapshot.data.result[index].text),
                        ));
                      },
                      child: ListTile(
                        leading: Image.asset("assets/images/eczane.png"),
                        title: Text(snapshot.data.result[index].text),
                      ),
                    ),
                    Divider(
                      color: Colors.black38,
                      indent: 25,
                      endIndent: 25,
                    )
                  ],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
