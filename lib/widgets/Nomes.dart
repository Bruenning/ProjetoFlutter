import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trabalho_flutter/Dados/Dados.dart';
import 'package:trabalho_flutter/components/Widgets.dart';

class Nomes extends StatefulWidget {
	const Nomes({Key? key}) : super(key: key);

	@override
	// ignore: library_private_types_in_public_api
	_NomesState createState() => _NomesState();
}

class _NomesState extends State<Nomes> {
	bool usarPadrao = false;
	final _formKey = GlobalKey<FormState>();

  @override
	void initState(){
    _leNomes();
		super.initState();
  }

  _leNomes() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState((){
      if(prefs.getString("nameNos") != null){
        Dados.jogo.nameNos = prefs.getString("nameNos")!;
        print(prefs.getString("nameNos"));
      }
      if(prefs.getString("nameEles") != null){
        Dados.jogo.nameEles = prefs.getString("nameEles")!;
        print(prefs.getString("nameNos"));
      }

    });

  }

	void _setarDados(String nos,String eles){
		setState(() {
			Dados.jogo.nameNos = nos;
      Widgets.salvar(nos, "nameNos");

			Dados.jogo.nameEles = eles;
      Widgets.salvar(eles, "nameEles",);
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
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
			),
			body: SingleChildScrollView(
				child: BootstrapContainer(
					fluid:true,
					decoration: const BoxDecoration(
						color: Colors.black,
					),
					padding: const EdgeInsets.only(top:0),
					children: <Widget>[
						BootstrapRow(
							height: 100,
							children: <BootstrapCol>[
								BootstrapCol(
									sizes: 'col-12',
									child: ElevatedButton(
										onPressed: () {
											setState(() {
												usarPadrao = true;
												_setarDados("Nós", 'Eles');
												Navigator.pushReplacementNamed(context,"/Home");
											});
										},
										child: Widgets.text('Usar nomes padrão'),
									),
								),
								BootstrapCol(
									child: Form(
										key: _formKey,
										child: BootstrapRow(
											children:[
												BootstrapCol(
													sizes: 'col-12',
													child: Widgets.textFormField('Nome do eles',usarPadrao,"nos",Dados.jogo.nameNos),
												),
												BootstrapCol(
													sizes: 'col-12',
													child:Widgets.textFormField('Nome do eles',usarPadrao,"eles",Dados.jogo.nameEles),
												),
												BootstrapCol(
													sizes: 'col-12',
													child: ElevatedButton(
														onPressed: () {
															usarPadrao = false;
															if (_formKey.currentState!.validate()) {
																_formKey.currentState!.save();
                                
																Navigator.pushReplacementNamed(context, "/Home");

															}else{
																Widgets.snackBar(context, "Preencha os campos corretamente");
															}
														},
														child: Widgets.text('Usar nomes personalizados'),
													),
												),
											],
										),
									),
								),
								
							],
						),
					],
				),		
			),
			backgroundColor: Colors.black,
		);
	}
}
