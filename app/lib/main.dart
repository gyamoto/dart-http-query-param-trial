import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:app/resource.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PetApi _api = PetApi(ApiClient());

  Resource _resource = const Ready();

  void _request(List<int> ids) {
    setState(() {
      _resource = const Loading();
    });

    _api.getPetByIds(ids).then((value) {
      setState(() {
        _resource = Complete(value.toString());
      });
    }, onError: (error) {
      setState(() {
        _resource = Error(error.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API SAMPLE')),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(32),
          children: <Widget>[
            Center(
              child: Text(
                'STATUS: $_resource',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 32),
            FloatingActionButton(
              onPressed: () => _request([1, 2, 3]),
              child: Icon(Icons.refresh),
            ),
            const SizedBox(height: 64),
            _ResponseDetail(_resource),
          ],
        ),
      ),
    );
  }
}

class _ResponseDetail extends StatelessWidget {
  const _ResponseDetail(
    this._resource, {
    Key key,
  }) : super(key: key);

  final Resource _resource;

  String get _errorMessage {
    if (_resource is Complete) {
      return (_resource as Complete).response;
    } else if (_resource is Error) {
      return (_resource as Error).message;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Text(_errorMessage);
  }
}
