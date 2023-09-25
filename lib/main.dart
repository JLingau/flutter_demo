import 'package:flavor_bistro/screens/admin/add_product.dart';
import 'package:flavor_bistro/screens/dashboard/dashboard.dart';
import 'package:flavor_bistro/screens/products/search_product.dart';
import 'package:flavor_bistro/screens/products/products.dart';
import 'package:flavor_bistro/screens/onboarding/onboarding.dart';
import 'package:flavor_bistro/theme/colors.dart';
import 'package:flavor_bistro/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        title: "Flavor Bistro",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme(
            primary: primaryColor,
            onPrimary: Colors.white,
            secondary: secondaryColor,
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            background: Colors.white,
            onBackground: secondaryColor,
            surface: Colors.white,
            onSurface: secondaryColor,
            brightness: Brightness.light,
          ),
          textTheme: TextTheme(
            titleLarge: GoogleFonts.inter(
              fontSize: 20,
            ),
            bodyMedium: GoogleFonts.inter(),
            displaySmall: GoogleFonts.inter(),
          ),
        ),
        routes: {
          "/": (context) => const Onboarding(),
          "/dashboard": (context) => const Dashboard(),
          "/add_product": (context) => const AddProduct(),
          "/products": (context) => const Products(),
          "/search_product": (context) => const SearchProduct(),
        },
      ),
    );
  }
}
