import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/utils/app_routes.dart';

class CatedoryItem extends StatelessWidget {
  final Category category;
  const CatedoryItem(this.category, {super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(
      context,
    ).pushNamed(AppRoutes.CATEGORY_MEALS, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [category.color.withOpacity(0.5), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
