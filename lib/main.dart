import 'package:flutter/material.dart';
import 'package:trabalho_flutter/components/Splash.dart';
import 'package:trabalho_flutter/widgets/Nomes.dart';
import 'package:trabalho_flutter/widgets/inicializate.dart';
//placar do truco

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Placar Truco',
			debugShowCheckedModeBanner: false,
			theme: ThemeData(
				colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
			),
			initialRoute: '/splash',
			routes: {
				'/splash': (context) => const Splash(),
				'/Home': (context) => const MyHomePage(),
				'/':(context) => const Nomes()
			},
		);
	}
}
