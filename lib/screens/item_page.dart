import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/category/category_cubit.dart';
import '../colors.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CategoryArguments;
    final items = args.items;
    final color = args.color;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: color,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: MyColors().textColor,
                        )),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        items[0].categoryName,
                        style: TextStyle(
                            color: MyColors().textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 150,
                              childAspectRatio: 2 / 3,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 0),
                      itemCount: items.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                if (items[index].sentences.isNotEmpty) {
                                  Navigator.of(context).pushNamed(
                                      '/itemdetailspage',
                                      arguments: items[index]);
                                }
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue),
                                child: Image(
                                  image: AssetImage(items[index].image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              items[index].name,
                              style: TextStyle(
                                color: MyColors().textColor,
                                fontSize: 18,
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
