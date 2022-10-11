import 'package:flutter/material.dart';
import 'package:trabalho_flutter/components/Widgets.dart';
import 'package:trabalho_flutter/widgets/Nomes.dart';

class Splash extends StatefulWidget {
	const Splash({Key? key}) : super(key: key);

	@override
	// ignore: library_private_types_in_public_api
	_splashState createState() => _splashState();
}

// ignore: camel_case_types
class _splashState extends State<Splash> {

	@override
	void initState(){
		super.initState();
		_navegatorHome();
	}

	_navegatorHome() async{
		await Future.delayed(const Duration(seconds: 3), () {});
		// ignore: use_build_context_synchronously
		Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Nomes()));
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
            Widgets.text("Truco",cor: Colors.black,  tamFont: 30),
						Image.asset('assets/images/truco.png'),
						const SizedBox(height: 20),
						const CircularProgressIndicator(),
					],
				),
			),
		);
	}
}