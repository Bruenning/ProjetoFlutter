import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import '../Dados/Dados.dart';

class Historico extends StatefulWidget {
	const Historico({super.key});

	@override
	_HistoricoState createState() => _HistoricoState();
}

class _HistoricoState  extends State<Historico>{
	 
	void _limparDados(){
		setState((){
			Dados.dadosSalvos.clear();
			_reset();
		});
	}
	_reset(){
		setState(() {
			Dados.jogo.nos = 0;
			_eles = 0;
			_multitruco = 0;
			_isTruco = false;
			_fim = false;
		});
	}

	@override 
	Widget build(BuildContext context) {
		return SingleChildScrollView(
			child:BootstrapContainer(
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
								sizes:'col-12',
								orders:'order-12',
								child: ElevatedButton(
									onPressed: () {
										_limparDados();
									},
									child: const Text('Limpar histórico'),
								),
							),
							BootstrapCol(
								sizes: 'col-12',
								child: Text(dadosSalvos.toString(),style: const TextStyle(color: Colors.white, fontSize: 18))
							)
						]
					)
				],
			)
		);
	}
}