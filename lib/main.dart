import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:lista04/widgets/Paginas.dart';
//placar do truco

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return const MaterialApp(
			title: 'Lista 04',
			home: MyHomePage(),
		);
	}
}

class MyHomePage extends StatefulWidget {
	const MyHomePage({super.key});

	@override
	// ignore: library_private_types_in_public_api
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
	var _currentPage = 0;
	final _page =[
		const HomePage(),
		const Historico(),
	];

	@override
	void initState(){
		super.initState();
		bootstrapGridParameters(
			gutterSize: 30	
		);
	}

	@override
	Widget build(BuildContext context){
		return  Scaffold(
			appBar: AppBar(
				title: const Text("Flutter Bootstrap", style: TextStyle(color: Colors.black)),
				backgroundColor: Colors.black,
				
			),
			bottomNavigationBar:  BottomNavigationBar(
				items: const [
					BottomNavigationBarItem(
						icon: Icon(
							Icons.home,
							color: Colors.black,
						),
						label: "Home",
					),
					BottomNavigationBarItem(
						icon: Icon(
							IconData(0xe314, fontFamily: 'MaterialIcons'),
							color: Colors.black,
						),
						label: "Aniversário",
					),
				],
				currentIndex: 0,
				fixedColor: Colors.black,
				onTap: (int inIndex) {
					setState(() {
						_currentPage = inIndex;
					});
				},
			),
			body:_page.elementAt(_currentPage),
				backgroundColor: Colors.black,

		);
	}
}
