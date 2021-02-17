import 'package:flutter/material.dart';

class Contribution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.black],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 120,
              top: 240,
              child: Text(
                'List Kelompok',
                style: TextStyle(
                    fontFamily: 'ReggaeOne',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            Center(
              child: Card(
                elevation: 10,
                shadowColor: Colors.white,
                child: Container(
                  color: Colors.amber,
                  child: DataTable(
                    horizontalMargin: 10,
                    columns: [
                      DataColumn(
                          label: Center(
                        child: Text(
                          'Name',
                          style: TextStyle(
                              fontFamily: 'ReggaeOne',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black54),
                        ),
                      )),
                      DataColumn(
                          label: Center(
                        child: Text(
                          'NPM',
                          style: TextStyle(
                              fontFamily: 'ReggaeOne',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black54),
                        ),
                      )),
                      DataColumn(
                          label: Center(
                        child: Text(
                          'Contributions',
                          style: TextStyle(
                              fontFamily: 'ReggaeOne',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black54),
                        ),
                      )),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text(
                          'Tony Nurdianto',
                          style: TextStyle(
                              fontFamily: 'ReggaeOne',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black54),
                        )),
                        DataCell(Center(
                          child: Text(
                            '17111317',
                            style: TextStyle(
                                fontFamily: 'ReggaeOne',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black54),
                          ),
                        )),
                        DataCell(Center(
                            child: Text(
                          'Full',
                          style: TextStyle(
                              fontFamily: 'ReggaeOne',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black54),
                        ))),
                      ]),
                      DataRow(cells: [
                        DataCell(Center(
                          child: Text(
                            'Firman Moch Rizal',
                            style: TextStyle(
                                fontFamily: 'ReggaeOne',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black54),
                          ),
                        )),
                        DataCell(Center(
                          child: Text(
                            '17111213  ',
                            style: TextStyle(
                                fontFamily: 'ReggaeOne',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black54),
                          ),
                        )),
                        DataCell(Center(
                          child: Text(
                            'None',
                            style: TextStyle(
                                fontFamily: 'ReggaeOne',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black54),
                          ),
                        )),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          'Moch Khosy',
                          style: TextStyle(
                              fontFamily: 'ReggaeOne',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black54),
                        )),
                        DataCell(Center(
                          child: Text(
                            '18111094 ',
                            style: TextStyle(
                                fontFamily: 'ReggaeOne',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black54),
                          ),
                        )),
                        DataCell(Center(
                          child: Text(
                            'None',
                            style: TextStyle(
                                fontFamily: 'ReggaeOne',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black54),
                          ),
                        )),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
