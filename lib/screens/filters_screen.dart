import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routName = '/filters';
  final Function saveFilters;

 FilterScreen(this.saveFilters) ;


  @override
  _FilterScreen createState() => _FilterScreen();
}

class _FilterScreen extends State<FilterScreen> {
  bool _glutenFree=false;
  bool _lactoseFree=false;
  bool _vegan=false;
  bool _vegetarian=false;

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters !'),actions: [
          IconButton(onPressed:widget.saveFilters, icon: Icon(Icons.save))
      ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  'Gluten-Free', 'only include gluten free meals ', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              buildSwitchListTile(
                  'Lactose-Free', 'only include Lactose-Free meals ', _lactoseFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
              buildSwitchListTile(
                  'Vegetarian', 'only include Vegetarian meals ', _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              buildSwitchListTile(
                  'Vegan', 'only include Vegan meals ', _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
