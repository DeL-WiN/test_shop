
import 'package:flutter/material.dart';

class CatalogListTile extends StatelessWidget {
  final imgUrl;
   const CatalogListTile({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // навігація на сторінку каталогу
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text('TOP SALE'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('12.01.2023'),
              Row(
                children: const [
                  Icon(Icons.star, size: 15, color: Colors.amberAccent,),
                  Text('8.7'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
