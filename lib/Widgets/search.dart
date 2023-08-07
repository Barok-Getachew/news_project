import 'package:flutter/material.dart';

// ignore: camel_case_types
class mySearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = '';
        }
      },
    );
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestion = ['sport', 'buisness'];
    return ListView.builder(
      itemBuilder: ((context, index) => ListTile(
            leading: Text(suggestion[index]),
          )),
      itemCount: suggestion.length,
    );

    throw UnimplementedError();
  }
}
