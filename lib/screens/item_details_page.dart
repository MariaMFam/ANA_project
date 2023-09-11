import 'package:ana_project/bloc/home_name/home_name_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/category/category_cubit.dart';
import '../colors.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CategoryItems;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: args.color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: MyColors().textColor,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/categorypage');
                          },
                          icon: Icon(
                            Icons.home_outlined,
                            size: 30,
                            color: MyColors().textColor,
                          )),
                    ],
                  ),
                  CircleAvatar(
                    radius: 33,
                    backgroundImage: AssetImage(args.image2),
                  ),
                  Text(
                    args.name,
                    style: TextStyle(
                      color: MyColors().textColor,
                      fontSize: 25,
                    ),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.fromLTRB(20, 30, 80, 20),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 400,
                              childAspectRatio: 4 / 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: args.sentences.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return BlocBuilder<CategoryCubit, CategoryState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox( width: 200,
                                  child: Text(
                                    (args.sentences[index] == '')
                                        ? 'أنا ${BlocProvider.of<HomeNameCubit>(context).name}  '
                                        : args.sentences[index],
                                    style: TextStyle(
                                      color: MyColors().textColor,
                                      fontSize: 25,
                                    ),
                                    maxLines: 2,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (args.sentences[index] == '') {
                                      BlocProvider.of<CategoryCubit>(context)
                                          .updateSpeech(
                                              'أنا ${BlocProvider.of<HomeNameCubit>(context).name} ');
                                      BlocProvider.of<CategoryCubit>(context)
                                          .listen();
                                    } else {
                                      BlocProvider.of<CategoryCubit>(context)
                                          .updateSpeech(args.sentences[index]);
                                      BlocProvider.of<CategoryCubit>(context)
                                          .listen();
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 17,
                                    backgroundImage:
                                        AssetImage(args.emojis[index]),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 80, 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'اضف جملة',
                          style: TextStyle(
                            color: MyColors().textColor,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        CircleAvatar(
                          radius: 17,
                          backgroundImage: AssetImage(
                            'assets/emojis_ppl/plus.png',
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
