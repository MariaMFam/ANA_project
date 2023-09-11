import 'dart:ui';

import 'package:ana_project/colors.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  FlutterTts ftts = FlutterTts();


  List<CategoryItems> personItems = [
    CategoryItems(
      name: 'أخُ',
      sentences: [
        'هذا هو أخي',
        'أين أخي ؟',
        'أُحب أخي',
      ],
      emojis: [
        'assets/emojis_ppl/ppl1.png',
        'assets/emojis_ppl/ppl2.png',
        'assets/emojis_ppl/ppl3.png',
      ],
      image: 'assets/people/bro.png',
      image2: 'assets/people/bro_c.png',
      color: MyColors().orangeColor1,
      categoryName: 'أَشْخاص',
    ),
    CategoryItems(
      name: 'أُمّ',
      sentences: [
        'هذه هى أمي',
        'أين أمي ؟',
        'أُحب أمي',
      ],
      emojis: [
        'assets/emojis_ppl/ppl1.png',
        'assets/emojis_ppl/ppl2.png',
        'assets/emojis_ppl/ppl3.png',
      ],
      image: 'assets/people/mom.png',
      image2: 'assets/people/mom_c.png',
      color: MyColors().blueColor,
      categoryName: 'أَشْخاص',
    ),
    CategoryItems(
      name: 'أبُ',
      sentences: [
        'هذا هو أبي',
        'أين أبي ؟',
        'أُحب أبي',
      ],
      emojis: [
        'assets/emojis_ppl/ppl1.png',
        'assets/emojis_ppl/ppl2.png',
        'assets/emojis_ppl/ppl3.png',
      ],
      image: 'assets/people/dad.png',
      image2: 'assets/people/dad_c.png',
      color: MyColors().accentColor,
      categoryName: 'أَشْخاص',
    ),
    CategoryItems(
      name: 'جَدّة',
      sentences: [],
      emojis: [],
      image: 'assets/people/gramma.png',
      image2: 'assets/people/gramma_c.png',
      color: MyColors().orangeColor2,
      categoryName: 'أَشْخاص',
    ),
    CategoryItems(
      name: 'جَدّ',
      sentences: [],
      emojis: [],
      image: 'assets/people/grampa.png',
      image2: 'assets/people/grampa_c.png',
      color: MyColors().blueColor,
      categoryName: 'أَشْخاص',
    ),
    CategoryItems(
      name: 'أُخت',
      sentences: [],
      emojis: [],
      image: 'assets/people/sis.png',
      image2: 'assets/people/sis_c.png',
      color: MyColors().redColor,
      categoryName: 'أَشْخاص',
    ),
    CategoryItems(
      name: 'صَديق/صَديقة',
      sentences: [],
      emojis: [],
      image: 'assets/people/friend.png',
      image2: 'assets/people/friend_c.png',
      color: MyColors().redColor,
      categoryName: 'أَشْخاص',
    ),
    CategoryItems(
      name: 'مُعَلِّمٌ/مُعَلِّمٌة',
      sentences: [],
      emojis: [],
      image: 'assets/people/teacher.png',
      image2: 'assets/people/teacher_c.png',
      color: MyColors().orangeColor1,
      categoryName: 'أَشْخاص',
    ),
    CategoryItems(
      name: 'طَبيب/طَبيبة',
      sentences: [],
      emojis: [],
      image: 'assets/people/dr.png',
      image2: 'assets/people/dr_c.png',
      color: MyColors().accentColor,
      categoryName: 'أَشْخاص',
    ),
  ];

  List<CategoryItems> conversationItems = [
    CategoryItems(
      name: 'تَفاعُلُ',
      sentences: [
        'شُكْرًا',
        'عَفْواً',
        'آسِف',
      ],
      emojis: [
        'assets/emojis_convo/yes3.png',
        'assets/emojis_convo/yes4.png',
        'assets/emojis_convo/yes5.png',
      ],
      image: 'assets/conversation/interact.png',
      image2: 'assets/conversation/interact_c.png',
      color: MyColors().redColor,
      categoryName: 'حِوَارٌ و مُحادَثة',
    ),
    CategoryItems(
      name: 'التحية و الوَدَاعُّ',
      sentences: [
        'أهْلاً بِكَ',
        'كَيْفَ حالُكَ؟',
        'سررت بلقائك',
        'إلى اللِّقاء',
      ],
      emojis: [
        'assets/emojis_convo/hi1.png',
        'assets/emojis_convo/hi2.png',
        'assets/emojis_convo/hi3.png',
        'assets/emojis_convo/hi4.png',
      ],
      image: 'assets/conversation/hi_bye.png',
      image2: 'assets/conversation/hi_bye_c.png',
      color: MyColors().orangeColor2,
      categoryName: 'حِوَارٌ و مُحادَثة',
    ),
    CategoryItems(
      name: 'أناُ',
      sentences: [
        '',
        'أنا في بَعْضِ الأحْيانِ لا استطيع الكلام',
        'أنا أُعاني من مرض التوحد',
      ],
      emojis: [
        'assets/emojis_convo/me1.png',
        'assets/emojis_convo/me2.png',
        'assets/emojis_convo/me3.png',
      ],
      image: 'assets/conversation/me.png',
      image2: 'assets/conversation/me_c.png',
      color: MyColors().accentColor,
      categoryName: 'حِوَارٌ و مُحادَثة',
    ),
    CategoryItems(
      name: 'الرفض',
      sentences: [],
      emojis: [],
      image: 'assets/conversation/no.png',
      image2: 'assets/conversation/no_c.png',
      color: MyColors().orangeColor2,
      categoryName: 'حِوَارٌ و مُحادَثة',
    ),
    CategoryItems(
      name: 'الموافقةّ',
      sentences: [],
      emojis: [],
      image: 'assets/conversation/yes.png',
      image2: 'assets/conversation/yes_c.png',
      color: MyColors().blueColor,
      categoryName: 'حِوَارٌ و مُحادَثة',
    ),
  ];

  List<CategoryItems> feelingsItems = [
    CategoryItems(
      name: 'سَعَادَةٌ ',
      sentences: [
        'أنا سعيد',
        'هل تَشعُر بالسعادة؟',
        'أنت تجعلني أشعُر بالسعادة',
      ],
      emojis: [
        'assets/emojis_mood/mood1.png',
        'assets/emojis_mood/mood2.png',
        'assets/emojis_mood/mood3.png',
      ],
      image: 'assets/mood/happy.png',
      image2: 'assets/mood/happy_c.png',
      color: MyColors().accentColor,
      categoryName: 'مَشاعِر ',
    ),
    CategoryItems(
      name: 'حُزْنُ ',
      sentences: [
        'أنا حزين',
        'هل تشعُر بالحُزْنُ؟',
        'أنت تجعلني أشعُر بالحُزْنُ',
      ],
      emojis: [
        'assets/emojis_mood/mood1.png',
        'assets/emojis_mood/mood2.png',
        'assets/emojis_mood/mood3.png',
      ],
      image: 'assets/mood/sad.png',
      image2: 'assets/mood/sad_c.png',
      color: MyColors().blueColor,
      categoryName: 'مَشاعِر ',
    ),
    CategoryItems(
      name: 'غَضِبَ ',
      sentences: [
        'أنا غاضِب',
        'هل تشعُر بالغَضَبٌ؟',
        'أنت تجعلني أشعُر بالغَضَبٌ',
      ],
      emojis: [
        'assets/emojis_mood/mood1.png',
        'assets/emojis_mood/mood2.png',
        'assets/emojis_mood/mood3.png',
      ],
      image: 'assets/mood/mad.png',
      image2: 'assets/mood/mad_c.png',
      color: MyColors().redColor,
      categoryName: 'مَشاعِر ',
    ),
    CategoryItems(
      name: 'حُبّ',
      sentences: [],
      emojis: [],
      image: 'assets/mood/love.png',
      image2: 'assets/mood/love_c.png',
      color: MyColors().orangeColor2,
      categoryName: 'مَشاعِر ',
    ),
    CategoryItems(
      name: 'فُضول',
      sentences: [],
      emojis: [],
      image: 'assets/mood/curiosity.png',
      image2: 'assets/mood/curiosity_c.png',
      color: MyColors().orangeColor2,
      categoryName: 'مَشاعِر ',
    ),
    CategoryItems(
      name: 'خيبة الأمل',
      sentences: [],
      emojis: [],
      image: 'assets/mood/down.png',
      image2: 'assets/mood/down_c.png',
      color: MyColors().orangeColor2,
      categoryName: 'مَشاعِر ',
    ),
    CategoryItems(
      name: 'مَلَل',
      sentences: [],
      emojis: [],
      image: 'assets/mood/bored.png',
      image2: 'assets/mood/bored_c.png',
      color: MyColors().orangeColor2,
      categoryName: 'مَشاعِر ',
    ),
    CategoryItems(
      name: 'إرهاق',
      sentences: [],
      emojis: [],
      image: 'assets/mood/exhausted.png',
      image2: 'assets/mood/exhausted_c.png',
      color: MyColors().orangeColor2,
      categoryName: 'مَشاعِر ',
    ),
    CategoryItems(
      name: 'حَماس',
      sentences: [],
      emojis: [],
      image: 'assets/mood/excited.png',
      image2: 'assets/mood/excited_c.png',
      color: MyColors().orangeColor2,
      categoryName: 'مَشاعِر ',
    ),
  ];

  List<Categories> categoryNamesList = [
    Categories(
      name: 'مَشاعِر',
      items: [],
      image: 'assets/categories/mood.png',
    ),
    Categories(
      name: 'أَشْخاص',
      items: [],
      image: 'assets/categories/ppl.png',
    ),
    Categories(
      name: 'حِوَارٌ و مُحادَثة',
      items: [],
      image: 'assets/categories/conv.png',
    ),
    Categories(
      name: 'خُضْرَوات',
      items: [],
      image: 'assets/categories/vegs.png',
    ),
    Categories(
      name: 'فَواكِهُ',
      items: [],
      image: 'assets/categories/fruits.png',
    ),
    Categories(
      name: 'طَعامَ',
      items: [],
      image: 'assets/categories/food.png',
    ),
    Categories(
      name: 'حَيَوانات',
      items: [],
      image: 'assets/categories/animals.png',
    ),
    Categories(
      name: 'أَرْقَامٌ',
      items: [],
      image: 'assets/categories/numbers.png',
    ),
    Categories(
      name: 'ألوان',
      items: [],
      image: 'assets/categories/colors.png',
    ),
    Categories(
      name: 'أَجَزَاء الجِسْمُ',
      items: [],
      image: 'assets/categories/body parts.png',
    ),
    Categories(
      name: 'مَلاَبِس',
      items: [],
      image: 'assets/categories/clothes.png',
    ),
    Categories(
      name: 'أَشْكَالٌ هَنْدَسِيَّةٌ',
      items: [],
      image: 'assets/categories/shapes.png',
    ),
    Categories(
      name: 'الأَثَاثُ',
      items: [],
      image: 'assets/categories/furniture.png',
    ),
    Categories(
      name: 'وَسَائِلُ النَّقْـلِ',
      items: [],
      image: 'assets/categories/transport.png',
    ),
    Categories(
      name: 'أماكِنُ',
      items: [],
      image: 'assets/categories/places.png',
    ),
    Categories(
      name: 'إضافة',
      items: [],
      image: 'assets/categories/plus.png',
    ),
    Categories(
      name: 'طَقْس',
      items: [],
      image: 'assets/categories/weather.png',
    ),
    Categories(
      name: 'التاريخ',
      items: [],
      image: 'assets/categories/calender.png',
    ),
  ];

  String speech = '';
  void updateSpeech(String speech1) {
    speech = speech1;
  }

  Future<void> listen() async {
    await ftts.setLanguage("ar-SA");
    await ftts.setSpeechRate(0.5); //speed of speech
    await ftts.setVolume(1.0); //volume of speech
    await ftts.setPitch(1); //pitc of sound

    //play text to sp
    var result = await ftts.speak(speech);
    if (result == 1) {
      //speaking
    } else {
      //not speaking
    }
  }
}

class CategoryItems {
  CategoryItems({
    required this.name,
    required this.categoryName,
    required this.sentences,
    required this.image,
    required this.image2,
    required this.emojis,
    required this.color,
  });
  String name;
  String categoryName;
  List<String> sentences;
  String image;
  String image2;
  List<String> emojis;
  Color color;
}

class Categories {
  Categories({
    required this.name,
    required this.items,
    required this.image,
  });
  String name;
  List<CategoryItems> items;
  String image;
}

class CategoryArguments {
  List<CategoryItems> items;
  Color color;
  CategoryArguments({
    required this.items,
    required this.color,
  });
}
