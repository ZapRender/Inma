import 'dart:html';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../../constants.dart';

// ignore: camel_case_types
class showInventary extends StatelessWidget {
  /*getDataFromDatabase() async {
    var value = FirebaseFirestore.instance.colection('');
    var getValue = await value.child('DataGrid');
  }*/
  //documents ids

  //get docIDs

  const showInventary({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference productos =
        FirebaseFirestore.instance.collection('productos');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding),
        Expanded(
          flex: 5,
          child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: FutureBuilder(
                  future: productos.get(),
                  builder: (context, snapshot) {
                    //Error Handling conditions
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }

                    if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                      return Text("Document does not exist");
                    }

                    //Data is output to the user
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<QueryDocumentSnapshot> rawData = snapshot.data!.docs;
                      //return Text("Full Name: ${data['full_name']} ${data['last_name']}");
                      List<DataRow> Data = rawData.map((e){
                        return DataRow(cells: [
                          DataCell(
                            Text(e.get('nombre')),
                          ),
                        ])
                      }).toList()
                    }

                    return DataTable(columns: [DataRow()], rows: rows)
                  })),
        ),
      ],
    );
  }
}
