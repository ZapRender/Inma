import 'dart:html';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../../constants.dart';

// ignore: camel_case_types
class showInventary extends StatelessWidget {
  getDataFromDatabase() async {
    var value = FirebaseFirestore.instance.colection('');
    var getValue = await value.child('DataGrid');
  }
  //documents ids

  //get docIDs

  const showInventary({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('cantidad')),
                DataColumn(label: Text('unidad')),
                DataColumn(label: Text('precio'))
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(
                    Text('AZUL'),
                  ),
                  DataCell(Text('98')),
                  DataCell(Text('98')),
                  DataCell(Text('98')),
                ]),
                DataRow(cells: [
                  DataCell(
                    Text('AZUL'),
                  ),
                  DataCell(Text('98')),
                  DataCell(Text('98')),
                  DataCell(Text('98')),
                ]),
                DataRow(cells: [
                  DataCell(
                    Text('AZUL'),
                  ),
                  DataCell(Text('98')),
                  DataCell(Text('98')),
                  DataCell(Text('98')),
                ]),
                DataRow(cells: [
                  DataCell(
                    Text('AZUL'),
                  ),
                  DataCell(Text('98')),
                  DataCell(Text('98')),
                  DataCell(Text('98')),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
