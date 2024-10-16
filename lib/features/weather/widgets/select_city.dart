import 'package:flutter/material.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({super.key});

  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City'),
      ),
      body: Form(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextFormField(
                  validator: (value) => value!.isEmpty ? "Please Enter City" : null,
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    hintText: 'Chicago',
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                if(_cityController.text.isEmpty){ return;}
                Navigator.pop(context, _cityController.text.trim());
              },
            ),
          ],
        ),
      ),
    );
  }
}