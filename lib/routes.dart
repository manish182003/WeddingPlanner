import 'package:eternal_tie/Admin/Vendors/screens/vendor_create.dart';
import 'package:eternal_tie/Auth/auth_pages/auth_login.dart';
import 'package:eternal_tie/Auth/auth_pages/auth_register.dart';
import 'package:eternal_tie/Auth/auth_pages/change_Password.dart';
import 'package:eternal_tie/Auth/auth_pages/forgetPassword.dart';
import 'package:eternal_tie/Auth/auth_pages/otp_screen.dart';
import 'package:eternal_tie/Auth/splash/splash_screen.dart';
import 'package:eternal_tie/User/Home/screens/Bottom_Nav_Screen.dart';
import 'package:eternal_tie/User/Home/screens/SearchScreen.dart';
import 'package:eternal_tie/User/Home/screens/VenueDetails.dart';
import 'package:eternal_tie/User/Home/screens/all_Photographer.dart';
import 'package:eternal_tie/User/Home/screens/all_Venue.dart';
import 'package:eternal_tie/User/Home/screens/home_screen.dart';
import 'package:eternal_tie/User/Home/screens/photographerDetails.dart';
import 'package:eternal_tie/User/Home/services/allVenueData.dart';
import 'package:flutter/material.dart';

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routename:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );

    case AuthLogin.routename:
      return MaterialPageRoute(
        builder: (context) => const AuthLogin(),
      );

    case ChangePassword.routename:
      var email = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => ChangePassword(
          email: email['email'],
        ),
      );

    case CreateVendors.routename:
      return MaterialPageRoute(
        builder: (context) => const CreateVendors(),
      );

    case OtpScreen.routename:
      var email = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => OtpScreen(
          email: email['email'],
        ),
      );

    case ForgetPassword.routename:
      return MaterialPageRoute(
        builder: (context) => const ForgetPassword(),
      );

    case PhotoGraphDetails.routename:
      var photo = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => PhotoGraphDetails(
          image: photo['image'],
          name: photo['name'],
          isfetch: photo['isfetch'],
          tag: photo['id'],
          price: photo['price'],
          place: photo['place'],
        ),
      );

    case VenueDetails.routename:
      var venueData = settings.arguments as AllVenueData;
      return MaterialPageRoute(
        builder: (context) => VenueDetails(
          image: venueData.image,
          name: venueData.name,
          place: venueData.place,
          price: venueData.price,
          tag: venueData.tag,
          isfetch: venueData.isfetch,
        ),
      );

    case HomeScreen.routename:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

    case AuthRegister.routename:
      return MaterialPageRoute(
        builder: (context) => const AuthRegister(),
      );

    case AllVenuesScreen.routename:
      return MaterialPageRoute(
        builder: (context) => const AllVenuesScreen(),
      );

    case SearchScreen.routename:
      var term = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => SearchScreen(
          isVenue: term['term'],
        ),
      );

    case AllPhotographers.routename:
      return MaterialPageRoute(
        builder: (context) => const AllPhotographers(),
      );

    case BottomNavBar.routename:
      return MaterialPageRoute(
        builder: (context) => const BottomNavBar(),
      );
    default:
      return MaterialPageRoute(builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text('Something Went Wrong'),
          ),
        );
      });
  }
}
