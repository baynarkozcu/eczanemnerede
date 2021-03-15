import 'package:flutter/material.dart';
import 'package:nobetcieczane/services/cityList.dart';
import 'package:nobetcieczane/ilcepage.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade800,
          title: Text("Nöbetçi Eczanem"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: CityList.cityList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => IlcePage(cityName:CityList.cityList[index] ,),
                    ));
                  },
                  child: ListTile(
                    leading: Image.asset("assets/images/eczane.png"),
                    title: Text(CityList.cityList[index]),
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
        ));
  }
}
