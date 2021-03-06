import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
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
  List showusermodelshow = [];
  List showusermodelV2 = [];
  List showusermodel = [];

  Future<void> fetchUser() async {
    UserService requsert = UserService();
    requsert.getUser().then((value) {
      // print('value ==> ${value.data}');
      if (value.statusCode == 200) {
        for (var item in value.data) {
          userList.add(User.fromJson(item));
          // print('item ==> ${item}');
        }
      } else {
        print('Backend error');
      }
      setState(() {});
    }).catchError((onError) {});
  }

  setNewDataYear(List? newData) async {
    setState(() {
      showusermodelshow = newData!;
    });
  }

  findDataYear(String? value) {
    if (value!.isNotEmpty) {
      //print(value.runtimeType);
      String _keyword = value.toLowerCase();
      var data = showusermodel.where(
        (element) =>
            element['glass'].toString().toLowerCase().contains(_keyword) ||
            element['iron'].toString().toLowerCase().contains(_keyword),
      );
      //print(data);
      setState(() {
        showusermodel = data.toList();
      });
    } else {
      showusermodel = showusermodelV2;
      // print(dataBranchCopy);
      setState(() {});
    }
  }

  bool checkedValue = false;
  late List<_ChartData> data5;
  late TooltipBehavior _tooltip;
  late TooltipBehavior _tooltip2;

  void _listener() {
    FirebaseDatabase.instance.ref().child('test').onValue.listen((event) {
      print(event.snapshot.value);
      Map<String, dynamic> v = (event.snapshot.value) as Map<String, dynamic>;
      // int a = v['a'];
      // int b = v['b'];
      // print("a: ${a}");
      // print("b: ${b}");
    });
  }

  @override
  void initState() {
    data5 = [
      _ChartData('?????????', 12, Colors.green),
      _ChartData('??????????????????', 15, Colors.teal),
      _ChartData('????????????', 30, Colors.teal),
      _ChartData('???????????????', 6.4, Colors.teal),
      _ChartData('??????????????????', 14, Colors.teal)
    ];
    _tooltip = TooltipBehavior(enable: true);
    _tooltip2 = TooltipBehavior(enable: true);

    setNewDataYear(userList);
    fetchUser().then((value) {
      print('fetchUser');
    });

    _listener();

    super.initState();
    print('initState');
  }

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
        title: const Text('ashgajkglwgsad'),
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
                          labelText: '???????????????',
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
                          labelText: '??????',
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
                    '???????????????',
                  ),

                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                    side: const BorderSide(
                      style: BorderStyle.none,
                    ),
                    backgroundColor: const Color(0xff64AE25),
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              myDivider(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 180,
                child: Consumer(
                  builder: (context, controller, child) => SfCartesianChart(
                    title: ChartTitle(text: "?????????????????????????????????????????????????????????"),
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    primaryYAxis:
                        NumericAxis(minimum: 0, maximum: 40, interval: 10),

                    // Enable legend
                    legend: Legend(isVisible: false),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_ChartData, dynamic>>[
                      ColumnSeries(
                          dataSource: data5,
                          xValueMapper: (data, _) => data.x,
                          yValueMapper: (data, _) => data.y,
                          name: '?????????????????????????????????????????? VAT',

                          // Enable data label
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: false))
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
                                title: const Text('????????????????????????????????????????????????'),
                                content: const Text('???????????? 50.00'),
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
                              '????????????????????????????????????\n50',
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
                                title: const Text('????????????????????????'),
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
                              "???????????????????????? \n   ${userList[index].glass}",
                              style: const TextStyle(
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
                                  dataSource: data5,

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
                                        "?????????????????????????????????",
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
      const DataColumn(label: Text('ID')),
      const DataColumn(label: Text('Book')),
      const DataColumn(label: Text('Author')),
      const DataColumn(label: Text('title2')),
      const DataColumn(label: Text('title2')),
      const DataColumn(label: Text('title2')),
    ];
  }

  List<DataRow> _createRows() {
    return List.generate(
      userList.length,
      (index) => DataRow(
        cells: [
          DataCell(
            Text('${userList[index].id}'),
          ),
          DataCell(
            Text('${userList[index].glass}'),
          ),
          DataCell(
            Text('${userList[index].paper}'),
          ),
          DataCell(
            Text('${userList[index].iron}'),
          ),
          DataCell(
            Text('${userList[index].lightbulb}'),
          ),
          DataCell(
            Text('${userList[index].bottle}'),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
  );
  final String x;
  final double y;
}

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
  List userList = <User>[];

  var currentStep = 0;
  var glass = TextEditingController();
  var paper = TextEditingController();
  var iron = TextEditingController();
  var lightbulb = TextEditingController();
  var bottle = TextEditingController();

  void addUser() async {
    UserService requsert = UserService();
    var reqbody = await {
      "id": null,
      "glass": glass.text,
      "paper": paper.text,
      "iron": iron.text,
      "lightbulb": lightbulb.text,
      "bottle": bottle.text,
    };
    print('reqbody ===> ${reqbody}');
    await requsert.postUser(reqbody).then(
          (value) => {
            if (value.statusCode == 201) {}
            // {print('value ===> ${value}'),('/home')}
          },
        );
  }

  void _addUser() {
    addUser();
    setState(() {});
  }

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

  @override
  void initState() {
    fetchUser().then((value) {
      print('fetchUser');
    });

    super.initState();
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _formKey,
      appBar: AppBar(
        title: const Text('Pagetwo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: Text(
                    '?????????????????????????????????',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    '?????????????????????????????????',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: '?????????????????????????????????',
                      border: OutlineInputBorder(),
                    ),
                    controller: glass,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextField(
                    controller: bottle,
                    decoration: const InputDecoration(
                      labelText: '?????????????????????????????????',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    // '',
                    '?????????????????????????????????', //
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    '?????????????????????????????????',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    '?????????????????????????????????',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: iron,
                    decoration: const InputDecoration(
                      labelText: '?????????????????????????????????',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextField(
                    controller: lightbulb,
                    decoration: const InputDecoration(
                      labelText: '?????????????????????????????????',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextField(
                    controller: paper,
                    decoration: const InputDecoration(
                      labelText: '?????????????????????????????????',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        addUser();

                        setState(() {});
                      },
                      child: Container(
                        // ?????????????????? container ???????????????????????????????????????????????????????????????
                        alignment: Alignment.center, // ???????????????????????????????????????????????????
                        width: double.infinity, // ???????????????????????????????????????????????????????????????
                        child: const Text('Add New Book'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        glass.clear();
                        paper.clear();
                        iron.clear();
                        lightbulb.clear();
                        bottle.clear();
                        setState(() {});
                      },
                      child: Container(
                        // ?????????????????? container ???????????????????????????????????????????????????????????????
                        alignment: Alignment.center, // ???????????????????????????????????????????????????
                        width: double.infinity, // ???????????????????????????????????????????????????????????????
                        child: const Text('Add New Book'),
                      ),
                    ),
                  ),
                ),
              ],
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
                                  "?????????????????????????????????",
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
      columnSpacing: 250,
      columns: _createColumns(),
      rows: _createRows(),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(label: Text('ID')),
      const DataColumn(label: Text('Book')),
      const DataColumn(label: Text('Author')),
      const DataColumn(label: Text('title2')),
      const DataColumn(label: Text('title2')),
      const DataColumn(label: Text('title2')),
    ];
  }

  List<DataRow> _createRows() {
    return List.generate(
      userList.length,
      (index) => DataRow(
        cells: [
          DataCell(
            Text('${userList[index].id}'),
          ),
          DataCell(
            Text('${userList[index].glass}'),
          ),
          DataCell(
            Text('${userList[index].paper}'),
          ),
          DataCell(
            Text('${userList[index].iron}'),
          ),
          DataCell(
            Text('${userList[index].lightbulb}'),
          ),
          DataCell(
            Text('${userList[index].bottle}'),
          ),
        ],
      ),
    );
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
      appBar: AppBar(title: const Text('Page3')),
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
      appBar: AppBar(title: const Text('Page4')),
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
      appBar: AppBar(title: const Text('Page5')),
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
      appBar: AppBar(title: const Text('Page6')),
      body: Center(
        child: Text('Page6', style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}
