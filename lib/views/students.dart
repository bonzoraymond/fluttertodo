import 'package:flutter/material.dart';

var name=[
  "Ray"
  "Ian",
  "Purity"
];

class Students extends StatelessWidget {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
          return Row(children: [
            Image.network(
              "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              height:100,
              width:100,
            ),
            const Column(children: [
              Text("MaryAnn"),
              Text("363839393"),
              Text("MaryAnn@gmil.com"),
            ],)
          ],
          );
        },)
      ],
    );
  }
}