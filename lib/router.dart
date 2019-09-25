import 'package:flutter/material.dart';
import 'const/route_const.dart';
import 'package:page_transition/page_transition.dart';
//
import 'views/start.dart';
import 'views/undefined/undefined.dart';
//
import 'views/sign_up/splash_sign_up_1.dart';
import 'views/sign_up/splash_sign_up_2.dart';
import 'views/sign_up/splash_sign_up_3.dart';
import 'views/sign_up/splash_sign_up_4.dart';
import 'views/sign_up/splash_sign_up_5.dart';
import 'views/sign_up/sign_up_1.dart';
import 'views/sign_up/sign_up_2.dart';
import 'views/sign_up/sign_up_3.dart';
//
import 'views/login.dart';
//
import 'views/home.dart';
//
import 'views/chats/chat.dart';
import 'views/chats/chat_albert.dart';
//
import 'views/explore/explore.dart';
import 'views/explore/search.dart';
import 'views/explore/search_result.dart';
//
import 'views/groups/groups.dart';
//
import 'views/community/community.dart';
import 'views/community/pahang_petany_home.dart';
//
import 'views/your_store/your-store.dart';
//
import 'views/education/education.dart';
import 'views/education/edu_search.dart';
//
import 'views/profile/profile.dart';
//
import 'views/farm_monitoring/farm_monitoring.dart';
//


Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case StartRoute :
      return MaterialPageRoute(builder: (context) => StartView());
      //
    case SplashSignUp1Route :
      return PageTransition(child: SplashSignUp1(), type: PageTransitionType.fade);
    case SplashSignUp2Route :
      return PageTransition(child: SplashSignUp2(), type: PageTransitionType.fade);
    case SplashSignUp3Route :
      return PageTransition(child: SplashSignUp3(), type: PageTransitionType.fade);
    case SplashSignUp4Route :
      return PageTransition(child: SplashSignUp4(), type: PageTransitionType.fade);
    case SplashSignUp5Route :
      return PageTransition(child: SplashSignUp5(), type: PageTransitionType.fade);
    case SignUp1Route :
      return MaterialPageRoute(builder: (context) => SignUp1());
    case SignUp2Route :
      return MaterialPageRoute(builder: (context) => SignUp2());
    case SignUp3Route :
      return MaterialPageRoute(builder: (context) => SignUp3());
      //
    case LoginRoute :
      return MaterialPageRoute(builder: (context) => Login());
      //
    case HomeRoute :
      return MaterialPageRoute(builder: (context) => Home());
      //
    case ExploreRoute :
      return MaterialPageRoute(builder: (context) => Explore());
    case SearchRoute :
      return MaterialPageRoute(builder: (context) => Search());
    case SearchResultRoute :
      return MaterialPageRoute(builder: (context) => SearchResult());
      //
    case GroupsRoute :
      return MaterialPageRoute(builder: (context) => Groups());
      //
    case CommunityRoute :
      return MaterialPageRoute(builder: (context) => Community());
    case PPHomeRoute :
      return MaterialPageRoute(builder: (context) => PPHome());
      //
    case YourStoreRoute :
      return MaterialPageRoute(builder: (context) => YourStore());
      //
    case EducationRoute :
      return MaterialPageRoute(builder: (context) => Education());
    case EducationSearchRoute :
      return MaterialPageRoute(builder: (context) => EduSearch());
      //
    case ProfileRoute :
      return MaterialPageRoute(builder: (context) => Profile());
      //
    case ChatRoute :
      return MaterialPageRoute(builder: (context) => Chat());
    case ChatAlbertRoute :
      return MaterialPageRoute(builder: (context) => ChatAlbert());
      //
    case FarmMonitoringRoute :
      return MaterialPageRoute(builder: (context) => FarmMonitoring());
      //
    default:
      return MaterialPageRoute(builder: (context) => Undefined());
  }
}