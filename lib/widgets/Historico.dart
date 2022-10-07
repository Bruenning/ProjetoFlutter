import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:trabalho_flutter/Dados/Dados.dart';
import 'package:trabalho_flutter/components/Widgets.dart';



class Historico extends StatefulWidget {
	const Historico({super.key});

	@override
	_HistoricoState createState() => _HistoricoState();
}

class _HistoricoState  extends State<Historico>{
	 
	void _limparDados(){
		setState((){
			Dados.dadosSalvos.clear();
			Dados.reset();
		});
	}

	String _dados(){
		String dados = "";

		setState(() {
			dados = Dados.dadosSalvos.toString();
		});

		return dados;
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
								child: ElevatedButton(
									onPressed: () {
										_limparDados();
									},
									child: Widgets.text('Limpar histórico'),
								),
							),
              				BootstrapCol(
								sizes: 'col-12',
								child: ElevatedButton(
									onPressed: () {
										Dados.reset();
									},
									child: Widgets.text('Resetar jogo'),
								),
            				),
							BootstrapCol(
								sizes: 'col-12',
								child: Widgets.text(_dados(), tamFont: 18)
							),
						]
					)
				],
			)
		);
	}
}