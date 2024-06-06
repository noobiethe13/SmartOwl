import 'package:flutter/cupertino.dart';
import '../../features/feed/screens/feed_screen.dart';
import '../../features/post/screens/add_post_screen.dart';


class Constants{
  static const logoPath = "assets/images/logo.png";
  static const loginImagePath = "assets/images/loginimage.png";
  static const googleLogoPath = "assets/images/googlelogo.png";
  static const appleLogoPath = "assets/images/applelogo.png";
  static const emailLogoPath = "assets/images/emaillogo.png";

  static const bannerDefault =
      'https://images.pexels.com/photos/1629236/pexels-photo-1629236.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  static const avatarDefault =
      'https://www.shutterstock.com/image-vector/owl-education-vectorowl-logo-graduation-teacher-1486775018';

  static const tabWidgets = [
    FeedScreen(),
    AddPostScreen(),
  ];

  static const IconData up = IconData(0xe800, fontFamily: 'MyFlutterApp', fontPackage: null);
  static const IconData down = IconData(0xe801, fontFamily: 'MyFlutterApp', fontPackage: null);

  static const awardsPath = 'assets/images/awards';

  static const awards = {
    'awesomeAns': '${Constants.awardsPath}/awesomeanswer.png',
    'gold': '${Constants.awardsPath}/gold.png',
    'platinum': '${Constants.awardsPath}/platinum.png',
    'helpful': '${Constants.awardsPath}/helpful.png',
    'plusone': '${Constants.awardsPath}/plusone.png',
    'rocket': '${Constants.awardsPath}/rocket.png',
    'thankyou': '${Constants.awardsPath}/thankyou.png',
    'til': '${Constants.awardsPath}/til.png',
  };
}