import 'package:dropdown/dropdown_bloc.dart';
import 'package:dropdown/state_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DropdownBloc _dropdownBloc;

  @override
  void initState() {
    _dropdownBloc = DropdownBloc();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder<List<StateModel>>(
              future: _dropdownBloc.states,
              builder: (context, snapshot) {
                return StreamBuilder<StateModel>(
                    stream: _dropdownBloc.selectedState,
                    builder: (context, item) {
                      return DropdownButton(
                        value: item.data,
                        onChanged: _dropdownBloc.selectedStateEvent,
                        items: snapshot?.data
                            ?.map<DropdownMenuItem<StateModel>>((e) {
                          return DropdownMenuItem<StateModel>(
                            value: e,
                            child: Text(e.nome),
                          );
                        })?.toList(),
                      );
                    });
              }),
          StreamBuilder<List<City>>(
            stream: _dropdownBloc.cities,
            builder: (context, snapshot) {
              return StreamBuilder<City>(
                stream: _dropdownBloc.selectedCity,
                builder: (context, items) {
                  return DropdownButton(
                    value: items.data,
                      onChanged: _dropdownBloc.selectedCityEvent,
                      items: snapshot?.data
                          ?.map<DropdownMenuItem<City>>((d) => DropdownMenuItem(
                                value: d,
                                child: Text(d.nome),
                              ))
                          ?.toList());
                }
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
