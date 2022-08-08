import 'package:flutter/material.dart'
;
import 'package:common/models/category_model.dart';

class CategoriesWidget extends StatelessWidget {
  final List<CategoryModel> categories;
  final Function(String) onPressed;
  const CategoriesWidget({Key? key, required this.categories, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 24.0),
            child: Text('Categories', style: Theme.of(context).textTheme.titleSmall),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 24.0),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => onPressed(categories[index].id),
                  child: CategoryTileWidget(category: categories[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CategoryTileWidget extends StatelessWidget {
  final CategoryModel category;
  const CategoryTileWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Theme.of(context).primaryColor),
          image: DecorationImage(
            image: NetworkImage(category.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black26,
          child: Center(
            child: Text(
              category.name,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      ),
    );
  }
}
