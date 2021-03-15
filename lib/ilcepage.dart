import 'package:flutter/material.dart';
import 'package:nobetcieczane/services/api.dart';
import 'package:nobetcieczane/models/ilce.dart';

class IlcePage extends StatelessWidget {
  final String cityName;

  const IlcePage({Key key, this.cityName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.cityName),
      ),
      body: FutureBuilder(
        future: Services.getIlce(this.cityName),
        builder: (context, AsyncSnapshot<List<Ilce>> snapshot) {
          if (snapshot.hasData) {

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("sad"),
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
