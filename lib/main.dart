// import 'dart:developer';
//
// import 'package:emirates_scholar/resource/repository/home_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:get_it/get_it.dart';
// import 'controller/Data_Store.dart';
// Future<void> main() async {
//   try {
//     await Future.wait([
//
//
//       DataStore.instance.init(),
//     ]);
//   } finally{
//     GetIt.I.allowReassignment = true;
//     GetIt.I.registerSingleton<HomeRepository>(HomeRepository());
//
//     log('language loaded is : ${DataStore.instance.lang}');
//     if (DataStore.instance.hasToken) {
//       log('user token is : ${DataStore.instance.token}');
//     } else {
//
//     }
//
//     runApp(
//       MultiBlocProvider(
//         providers: [
//           // BlocProvider(create: (context) => ApplicationCubit()),
//           // BlocProvider(create: (context) => ProfileCubit()),
//           // BlocProvider(create: (context) => IssuesCubit()),
//           // BlocProvider(create: (context) => HomeCubit()), //HomeCubit
//         ],
//         child: AppMaterial(),
//       ),
//     );
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       supportedLocales: [Locale("en"), Locale("ar")],
//       localizationsDelegates: [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//       ],
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:todo_task/resource/repository/todo_repo.dart';

import 'bloc/todo_cubit.dart';
import 'layout/todo_layout.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  } finally {
    GetIt.I.allowReassignment = true;
    GetIt.I.registerSingleton<ToDoRepository>(ToDoRepository());
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TodoCubit()),
        ],
        child: const AppMaterial(),
      ),
    );
  }
}

class AppMaterial extends StatefulWidget {
  const AppMaterial({Key? key}) : super(key: key);

  @override
  _AppMaterialState createState() => _AppMaterialState();
}

class _AppMaterialState extends State<AppMaterial> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(


      // navigatorKey: navigatorKey,
      title: "TODO",
      home: ToDoLayout(),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
    );
  }
}
