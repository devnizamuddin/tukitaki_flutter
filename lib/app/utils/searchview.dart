import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onClickSearch;
  final Function(String)? onChangeSearch;
  const SearchView({Key? key, required this.hintText, required this.controller, required this.onClickSearch, this.onChangeSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: hintText, border: InputBorder.none),
          onChanged: onChangeSearch,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.search),
          onPressed: onClickSearch,
        ),
      ),
    );
  }
}
