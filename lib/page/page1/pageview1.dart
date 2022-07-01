import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/user_models.dart';
import 'package:flutter_application_2/page/page2/pageview2.dart';
import 'package:flutter_application_2/services/user_services.dart';
import 'package:flutter_application_2/widget/my_text_form-field.dart';
import 'package:flutter_application_2/widget/mywidget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

final selectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
  final selectedPageKey = ref.watch(selectedPageNameProvider.state).state;
  return availablePages[selectedPageKey]!;
});

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List userList = <User>[];

  Future<void> fetchUser() async {
    UserService requsert = UserService();
    requsert.getUser().then((value) {
      print('value ==> ${value.data}');
      if (value.statusCode == 200) {
        for (var item in value.data) {
          userList.add(User.fromJson(item));
          print('item ==> ${item}');
        }
      } else {
        print('Backend error');
      }
      setState(() {});
    }).catchError((onError) {});
  }

  bool checkedValue = false;
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  late TooltipBehavior _tooltip2;

  @override
  void initState() {
    data = [
      _ChartData('ขวด', 12, Colors.green),
      _ChartData('กระดาษ', 15, Colors.teal),
      _ChartData('แก้ว', 30, Colors.teal),
      _ChartData('เหล็ก', 6.4, Colors.teal),
      _ChartData('หลอดไฟ', 14, Colors.teal)
    ];
    _tooltip = TooltipBehavior(enable: true);
    _tooltip2 = TooltipBehavior(enable: true);

    fetchUser().then((value) {
      print('fetchUser');
    });

    super.initState();
    print('initState');
  }

  List<Map> data2 = [
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics'
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
  ];

  @override
  // final List<ChartData> chartData = [
  //   ChartData('David', 25),
  //   ChartData('Steve', 38),
  //   ChartData('Jack', 34),
  //   ChartData('Others', 52)
  // ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ashgajkglwgsad'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.fromLTRB(10, 11, 10, 5),
          child: (Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: const [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'สถาณะ',
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,

                        //  onTap: () ,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'ปี',
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 80,
                child: OutlinedButton(
                  onPressed: () {},
                  // child: Text('Sign up'),
                  child: const Text(
                    'ค้นหา',
                  ),

                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                    side: const BorderSide(
                      style: BorderStyle.none,
                    ),
                    backgroundColor: Color(0xff64AE25),
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              myDivider(),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 180,
                child: Expanded(
                  // flex: 2,
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis:
                        NumericAxis(minimum: 0, maximum: 40, interval: 10),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<dynamic, dynamic>>[
                      ColumnSeries(
                          dataSource: userList,
                          xValueMapper: (data, _) => data['glass'],
                          yValueMapper: (data, _) => data['paper'],
                          pointColorMapper: (data, _) => data.color,
                          name: 'Gold',
                          color: const Color.fromRGBO(8, 142, 255, 1))
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('ราคาราคาปัญจุบัน'),
                                content: const Text('ราคา 50.00'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        child: Container(
                          color: Colors.green[100],
                          height: 220,
                          child: const Center(
                            child: Text(
                              'ราคาปัญจุบัน\n50',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('ราคาอดีต'),
                                content: Text('${userList[index].glass}'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            ),
                        child: Container(
                          color: Colors.red[100],
                          height: 220,
                          child: Center(
                            child: Text(
                              "ราคาอดีต \n   ${userList[index].glass}",
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              myDivider(),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Center(
                        child: Container(
                          child: SfCircularChart(
                            tooltipBehavior: _tooltip,
                            legend: Legend(isVisible: true),
                            series: <CircularSeries>[
                              PieSeries<_ChartData, String>(
                                  dataLabelSettings:
                                      const DataLabelSettings(isVisible: true),
                                  dataSource: data,

                                  // pointColorMapper:(_ChartData data, _) => data.color,
                                  xValueMapper: (_ChartData data, _) => data.x,
                                  yValueMapper: (_ChartData data, _) => data.y),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 250,
                      width: 650,
                      child: SingleChildScrollView(
                        // physics: const BouncingScrollPhysics(),
                        //  scrollDirection: Axis.horizontal,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              color: Colors.white,
                              child: Column(children: [
                                Row(
                                  children: const [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "ข้อมูลจำลอง",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Fcicon',
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                _createDataTable(),
                              ]),
                            )),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(
      columnSpacing: 250,
      columns: _createColumns(),
      rows: _createRows(),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Book')),
      DataColumn(label: Text('Author')),
      DataColumn(label: Text('title2'))
    ];
  }

  List<DataRow> _createRows() {
    return data2
        .map((data2) => DataRow(cells: [
              DataCell(Text(data2['id'].toString())),
              DataCell(Text(data2['title'])),
              DataCell(Text(data2['author'])),
              DataCell(Text(data2['title2']))
            ]))
        .toList();
  }
}

// class ChartData {
//   ChartData(
//     this.x,
//     this.y,
//   );
//   final String x;
//   final double y;
// }

class _ChartData {
  _ChartData(this.x, this.y, this.color);

  final String x;
  final double? y;
  final Color? color;
}

class FirstPagetwo extends StatefulWidget {
  FirstPagetwo({Key? key}) : super(key: key);

  @override
  State<FirstPagetwo> createState() => _FirstPagetwoState();
}

class _FirstPagetwoState extends State<FirstPagetwo> {
  List<Map> data2 = [
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics'
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
    {
      'id': 115,
      'title': 'Flutter Basics',
      'author': 'David John',
      'title2': 'Flutter Basics',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagetwo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'เพิ่มข้อมูล',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'เพิ่มข้อมูล',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Expanded(
                  child: Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'เพิ่มข้อมูล',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'เพิ่มข้อมูล',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    // '',
                    'เพิ่มข้อมูล', //
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'เพิ่มข้อมูล',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'เพิ่มข้อมูล',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Expanded(
                  child: Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'เพิ่มข้อมูล',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'เพิ่มข้อมูล',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'เพิ่มข้อมูล',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 250,
                // width: 650,
                child: SingleChildScrollView(
                  // physics: const BouncingScrollPhysics(),
                  //  scrollDirection: Axis.horizontal,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        color: Colors.white,
                        child: Column(children: [
                          Row(
                            children: const [
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  "ข้อมูลจำลอง",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Fcicon',
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          _createDataTable(),
                        ]),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(
      columnSpacing: 430,
      columns: _createColumns(),
      rows: _createRows(),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Book')),
      DataColumn(label: Text('Author')),
      DataColumn(label: Text('title2'))
    ];
  }

  List<DataRow> _createRows() {
    return data2
        .map((data2) => DataRow(cells: [
              DataCell(Text(data2['id'].toString())),
              DataCell(Text(data2['title'])),
              DataCell(Text(data2['author'])),
              DataCell(Text(data2['title2']))
            ]))
        .toList();
  }
}

Widget myDivider() {
  return const Divider(
    height: 5.0,
    color: Colors.green,
  );
}

class FirstPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page3')),
      body: Center(
        child: Text('Page3', style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}

class FirstPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page4')),
      body: Row(
        children: [
          Center(
            child: Text('Page4', style: Theme.of(context).textTheme.headline4),
          ),
        ],
      ),
    );
  }
}

class FirstPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page5')),
      body: Center(
        child: Text('Page5', style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}

class FirstPage6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page6')),
      body: Center(
        child: Text('Page6', style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}
