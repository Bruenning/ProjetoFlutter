import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:trabalho_flutter/Dados/Dados.dart';
import 'package:trabalho_flutter/components/Widgets.dart';

class Nomes extends StatefulWidget {
	const Nomes({Key? key}) : super(key: key);

	@override
	_NomesState createState() => _NomesState();
}

class _NomesState extends State<Nomes> {
	bool usarPadrao = false;
	final _formKey = GlobalKey<FormState>();

	void _setarDados(String nos,String eles){
		setState(() {
			Dados.jogo.nameNos = nos;
			Dados.jogo.nameEles = eles;
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
							height: MediaQuery.of(context).size.height,
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
													child: Widgets.textFormField(
														'Nome do eles',
														usarPadrao,
														"nos",
														Dados.jogo.nameNos

													),
												),
												BootstrapCol(
													sizes: 'col-12',
													child:Widgets.textFormField(
														'Nome do eles',
														usarPadrao,
														"eles",
														Dados.jogo.nameEles,
													),
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
