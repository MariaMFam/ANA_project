import 'package:ana_project/bloc/category/category_cubit.dart';
import 'package:ana_project/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../bloc/home_name/home_name_cubit.dart';
import '../colors.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  FlutterTts ftts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        iconSize: 30,
                        icon: Icon(
                          Icons.more_horiz,
                          color: MyColors().textColor,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context2) {
                                return AlertDialog(
                                  content: SettingsPage(),
                                );
                              });
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            BlocProvider.of<HomeNameCubit>(context).name,
                            style: TextStyle(
                                color: MyColors().textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'مرحباً',
                            style: TextStyle(
                                color: MyColors().textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          CircleAvatar(
                            radius: 23,
                            backgroundColor: MyColors().textColor,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundImage: AssetImage(
                                  BlocProvider.of<HomeNameCubit>(context)
                                      .imagePath),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  BlocBuilder<CategoryCubit, CategoryState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                        child: TextField(
                          onChanged: (value) {
                            BlocProvider.of<CategoryCubit>(context)
                                .updateSpeech(value);
                          },
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              prefixIcon: IconButton(
                                color: MyColors().textColor.withOpacity(0.5),
                                onPressed: () async {
                                  BlocProvider.of<CategoryCubit>(context)
                                      .listen();
                                },
                                icon: Icon(
                                  Icons.volume_up_outlined,
                                ),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 5),
                              filled: true,
                              fillColor: MyColors().accentColor,
                              hintTextDirection: TextDirection.rtl,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none)),
                              hintText: 'ماذا تريد أن تقول...',
                              hintStyle: TextStyle(
                                  color:
                                      MyColors().textColor.withOpacity(0.5))),
                        ),
                      );
                    },
                  ),
                  GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 40),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 150,
                              childAspectRatio: 2 / 3,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 0),
                      itemCount: BlocProvider.of<CategoryCubit>(context)
                          .categoryNamesList
                          .length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                if (index == 0) {
                                  Navigator.of(context).pushNamed('/itempage',
                                      arguments: CategoryArguments(items: BlocProvider.of<CategoryCubit>(
                                          context)
                                          .feelingsItems, color: MyColors().orangeColor1));
                                }
                                if (index == 1) {
                                  Navigator.of(context).pushNamed('/itempage',
                                      arguments: CategoryArguments(items: BlocProvider.of<CategoryCubit>(
                                          context)
                                          .personItems, color: MyColors().orangeColor2));
                                }
                                if (index == 2) {
                                  Navigator.of(context).pushNamed('/itempage',
                                      arguments: CategoryArguments(items: BlocProvider.of<CategoryCubit>(
                                          context)
                                          .conversationItems, color: MyColors().accentColor));
                                }
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(
                                      BlocProvider.of<CategoryCubit>(context)
                                          .categoryNamesList[index]
                                          .image,
                                    ))),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              BlocProvider.of<CategoryCubit>(context)
                                  .categoryNamesList[index]
                                  .name,
                              style: TextStyle(
                                color: MyColors().textColor,
                                fontSize: 18,
                              ),
                            )
                          ],
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//ماريا
