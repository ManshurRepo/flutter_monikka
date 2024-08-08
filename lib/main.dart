

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_scanqr/bloc/auth/auth_bloc.dart';
// import 'package:flutter_scanqr/bloc/product/product_bloc.dart';
// import 'firebase_options.dart';
// import 'routes/router.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  
//   runApp(const MyApp());
  
//   FlutterNativeSplash.remove();
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => AuthBloc(),
//         ),
//         BlocProvider(
//           create: (context) => ProductBloc(),
//         ),
//       ],
//       child: MaterialApp.router(
//         routerConfig: router,
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_scanqr/bloc/auth/auth_bloc.dart';
import 'package:flutter_scanqr/bloc/product/product_bloc.dart';
import 'firebase_options.dart';
import 'routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  
  runApp(const MyApp());
  
  // Menambahkan delay 5 detik sebelum menghapus splash screen
  await Future.delayed(const Duration(seconds: 5));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

