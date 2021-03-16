import 'package:flutter/material.dart';
import 'package:nobetcieczane/models/eczane.dart';
import 'package:nobetcieczane/services/api.dart';
import 'package:url_launcher/url_launcher.dart';

class EczanePage extends StatelessWidget {
  final String il;
  final String ilce;

  const EczanePage({Key key, this.il, this.ilce}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        title: Text(this.ilce + "/" + this.il),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Services.getEczane(
          this.ilce,
          this.il,
        ),
        builder: (context, AsyncSnapshot<Eczane> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.result.length,
              itemBuilder: (context, index) {
                var eczane = snapshot.data.result[index];

                if (snapshot.data.result.length == 0) {
                  return Center(
                    child: Text("Aradığını Kriterlerde Eczane Bulunamamıştır."),
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    height: eczane.address.length > 45 ? 200 : 150,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25, top: 25),
                            child: Text(
                              eczane.name,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 8),
                            child: InkWell(
                              onTap: () {
                                print("KONUM : " + eczane.loc);
                                launchURL(eczane.loc);
                              },
                              child: Row(
                                children: [
                                  Image(
                                    height: 30,
                                    width: 30,
                                    image:
                                        AssetImage("assets/images/adress.png"),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        eczane.address,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 8),
                            child: InkWell(
                              onTap: () {
                                launchCaller(eczane.phone);
                              },
                              child: Row(
                                children: [
                                  Image(
                                    height: 30,
                                    width: 30,
                                    image:
                                        AssetImage("assets/images/phone.png"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      eczane.phone,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
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

launchURL(String location) async {
  String googleMapslocationUrl =
      "https://www.google.com/maps/search/?api=1&query=" + location;

  final String encodedURl = Uri.encodeFull(googleMapslocationUrl);
  if (await canLaunch(encodedURl)) {
    await launch(encodedURl);
  } else {
    print("HATA");
  }
}

launchCaller(String phone) async {
  const url = "tel:";
  String deger = url + phone;
  if (await canLaunch(deger)) {
    await launch(deger);
  } else {
    print("HATA");
  }
}
