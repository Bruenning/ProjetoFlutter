import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:trabalho_flutter/widgets/HomePage.dart';
import 'package:trabalho_flutter/widgets/Historico.dart';

class MyHomePage extends StatefulWidget {
	const MyHomePage({super.key});

	@override
	// ignore: library_private_types_in_public_api
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
	  
	var _currentPage = 0;
	bool first = true;
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
       			automaticallyImplyLeading: false,
				title: const Text("Placar Truco", style: TextStyle(color: Colors.white)),
				backgroundColor: Colors.black,
				shape: const Border(
					bottom: BorderSide(
						color: Colors.red,
						width: 3,
					),
				),
				
				actions: <Widget>[
					PopupMenuButton(
						onSelected: (value){
							setState(() {
								Navigator.pushReplacementNamed(context, "/");
							});
						},
						itemBuilder: (context) => [
							const PopupMenuItem(
								value: '/Nomes',
								child: Text("Nomes"),
							),
						],
					),
				],
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
			body: _page.elementAt(_currentPage),
			backgroundColor: Colors.black,
		);
	}
}
