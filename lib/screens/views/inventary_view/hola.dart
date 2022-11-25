/*import 'dart:html';

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


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Widget buildProducto(Productos producto) => ListTile(
        leading: CircleAvatar(child: Text('${producto.costo}')),
        title: Text(producto.nombre),
        subtitle: Text(producto.cantidad.toString()),
      );

  @override
  Widget build(BuildContext context) {
    Stream<List<Productos>> readproductos() => FirebaseFirestore.instance
        .collection('productos')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Productos.fromJson(doc.data()))
            .toList());
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
                child: StreamBuilder(
                  stream: readproductos(),
                  builder: (context, AsyncSnapshot<dynamic> streamSnapshot) {
                    if (streamSnapshot.hasError) {
                      return Text(
                          'Something went wrong! ${streamSnapshot.error}');
                    } else if (streamSnapshot.hasData) {
                      final productos = streamSnapshot.data!;
                      return ListView(
                        children: [productos.map(buildProducto).toList()],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ))),
      ],
    );
  }
}

class Productos {
  String id;
  final int cantidad;
  final int costo;
  final int costoventa;
  final String nombre;
  final String unidad;

  Productos(
      {this.id = '',
      required this.cantidad,
      required this.costo,
      required this.costoventa,
      required this.nombre,
      required this.unidad});

  Map<String, dynamic> toJson() => {
        'id': id,
        'cantidad': cantidad,
        'costo': costo,
        'costoventa': costoventa,
        'nombre': nombre,
        'unidad': unidad
      };

  static Productos fromJson(Map<String, dynamic> json) => Productos(
      cantidad: json['id'],
      costo: json['costo'],
      costoventa: json['costoventa'],
      nombre: json['nombre'],
      unidad: json['unidad']);
}
*/
