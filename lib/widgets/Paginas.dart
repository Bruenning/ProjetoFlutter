// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

//home do placar do truco

	const List<String> truco = <String>['Truco', 'Seis', 'Nove', 'Doze', 'Maximo'];
  String dropdownValue = truco.first;
  List<String> dadosSalvos = <String>[];
	int _nos = 0;
	int _eles = 0;
	int _multitruco = 0;
	bool _isTruco = false;
	bool _fim = false;
	

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

	_ganhoNos(){
		setState(() {
			if(_nos == 0 && _eles == 0) {
			  dadosSalvos.add("\n---------------------------------\n\nNovo Jogo");
			}
			if(_isTruco && !_fim && _nos < 11){
				late int valor = (_nos +( 3 * _multitruco));

				if(valor > 12){
					_nos = 12;
				}else{
					_nos = valor;
				}
				dadosSalvos.add("\nNós: $_nos Eles: $_eles");

			}
			else if(_nos == 11 && _isTruco && !_fim){
				_fim = true;
				dadosSalvos.add("\nFim de Jogo: Nós ganharam\nA proxima não seja burro em pedir truco em mão de 11\n");

			}else if(!_fim){
				_nos++;
				dadosSalvos.add("\nNós: $_nos Eles: $_eles");

			}

			_multitruco = 0;
			_isTruco = false;
			
			if(_nos >= 12){
				_fim = true;
				dadosSalvos.add("\nFim de Jogo: Nós ganharam");
			}

		});
	}

	_ganhoEles(){
		setState(() {
			if(_nos == 0 && _eles == 0){
				dadosSalvos.add("\n---------------------------------\n\nNovo Jogo");
			}
			if(_isTruco && !_fim && _eles < 11){
				late int _valor = (_eles +( 3 * _multitruco));

				if(_valor > 12){
					_nos = 12;
				}else{
					_eles = _valor;
				}
				dadosSalvos.add("\nNos: $_nos Eles: $_eles");
			}
			else if(_eles == 11 && _isTruco && !_fim){
				_fim = true;
				dadosSalvos.add("\nFim de Jogo: Eles ganharam\nA proxima não seja burro em pedir truco em mão de 11\n");

			}
			else if(!_fim){
				_eles++;
				dadosSalvos.add("\nNos: $_nos Eles: $_eles");
			}
			_multitruco = 0;
			_isTruco = false;
			

			if(_eles >= 12){
				_fim = true;
				dadosSalvos.add("\nFim de Jogo: Eles ganharam\n");
			}

		});
	}

	_truco(int multiplicador){
		setState(() {
			if(!_fim && _multitruco <= 3){
				_multitruco = multiplicador++;
				_isTruco = true;
			}
		});
	}

	_reset(){
		setState(() {
			_nos = 0;
			_eles = 0;
			_multitruco = 0;
			_isTruco = false;
			_fim = false;
		});
	}

	@override 
	Widget build(BuildContext context) {
		_showIt(String Mensagem, String burro) {
		return showDialog(
			context: context,
			barrierDismissible: false,
			builder: (BuildContext context) {
				Center(
					child: Container( // A simplified version of dialog. 
						width: 100.0,
						height: 56.0,
						color: Colors.pink,
					)
				);
				return AlertDialog(
					title: Text(Mensagem,style: const TextStyle(fontSize: 18)),
					content: Column(
							children:<Widget>[
								Text(Mensagem, style: const TextStyle(fontSize: 36),),
								Text(burro, style: const TextStyle(fontSize: 22),)
							]
					),
					actions: [
					ElevatedButton(
						child: const Text("Iniciar novamente? "),
						onPressed: () {
							_reset();
							Navigator.of(context).pop();
						})
					]);
			});
		}
		return SingleChildScrollView(
			child:BootstrapContainer(
					fluid:true,
					decoration: const BoxDecoration(
						color: Colors.black,
					),
					padding: const EdgeInsets.only(top:0),
					children: <Widget>[
						BootstrapRow(
							height: 50,
							children: <BootstrapCol>[
								BootstrapCol(
									sizes:'col-6',
									child: Text("Nós: $_nos", style: const TextStyle(color: Colors.white, fontSize: 43),textAlign: TextAlign.center)
								),
								BootstrapCol(
									sizes:'col-6',
									child: Text("Eles: $_eles", style: const TextStyle(color: Colors.white, fontSize: 43),textAlign: TextAlign.center)
								),
							],
						),
						BootstrapRow(
							height:50,
							children: <BootstrapCol>[
								BootstrapCol(
									sizes:'col-6',
									child: ElevatedButton(
										style:ElevatedButton.styleFrom(
											shape: RoundedRectangleBorder(
												borderRadius: BorderRadius.circular(20.0),
											),
											padding: const EdgeInsets.all(10.0),
											alignment: Alignment.center
										),
										child:Row(
											children: const<Widget>[
												Tab(icon: Icon(Icons.add)),
												Text("Nós", style: TextStyle(color: Colors.white, fontSize: 16),textAlign: TextAlign.center),
											],
										),
										onPressed:(){
											_ganhoNos();
											if(_fim && _nos == 11){
												_showIt("O vencedor foi: Eles","A proxima não seja burro em pedir truco em mão de 11");
											}
											else if(_fim){
												_showIt("O vencedor foi: Nós", "");
											}
										}										
									)
								),
								BootstrapCol(
									sizes:'col-6',
									child: ElevatedButton(
										style:ElevatedButton.styleFrom(
											shape: RoundedRectangleBorder(
												borderRadius: BorderRadius.circular(20.0),
											),
											padding: const EdgeInsets.all(10.0),
											alignment: Alignment.center
										),
										child:Row(
											children: const<Widget>[
												Tab(icon: Icon(Icons.add)),
												Text("Eles", style: TextStyle(color: Colors.white, fontSize: 16),textAlign: TextAlign.center),
											],
										),
										onPressed:(){
											_ganhoEles();
											if(_fim && _eles == 11){
												_showIt("O vencedor foi: Nós","A proxima não seja burro em pedir truco em mão de 11");
											}
											else if(_fim){
												_showIt("O vencedor foi: Eles", "");
											}
										}										
									)
								)
							],
						),
						const Divider(),
						BootstrapRow(
							height: 70,
							children: <BootstrapCol>[
								BootstrapCol(
									sizes:'col-6',
									child:ElevatedButton(
										onPressed:(){
											_truco(_multitruco+1);
										},
										style:ElevatedButton.styleFrom(
											shape: RoundedRectangleBorder(
												borderRadius: BorderRadius.circular(20.0),
											),
											padding: const EdgeInsets.all(10.0),
										),
										child: BootstrapRow(
											children:<BootstrapCol>[
												BootstrapCol(
													child: Text("Aumentar: ${truco.elementAt(_multitruco)}\n", style: const TextStyle(color: Colors.white, fontSize: 16),textAlign: TextAlign.center)
												),
												BootstrapCol(
													child:_multitruco != 0 ? Text("Está em: ${truco.elementAt(_multitruco-1)}", style: const TextStyle(color: Colors.white, fontSize: 16),textAlign: TextAlign.center) : const Text("Está em Normal", style: TextStyle(color: Colors.white, fontSize: 16),textAlign: TextAlign.center)
												)
												
											],
										)
									)
								),
								BootstrapCol(
									sizes:'col-6',
									child:ElevatedButton(
										style:ElevatedButton.styleFrom(
											shape: RoundedRectangleBorder(
												borderRadius: BorderRadius.circular(20.0),
											),
											padding: const EdgeInsets.all(10.0),
										),
										child: const Text("Reset", style: TextStyle(color: Colors.white, fontSize: 16),textAlign: TextAlign.center),
										onPressed:(){
											_reset();
										}
									)
								)
							]
						)
						
					],
				)
		);
	}
}

class Historico extends StatefulWidget {
	const Historico({super.key});

	@override
	_HistoricoState createState() => _HistoricoState();
}

class _HistoricoState  extends State<Historico>{
   
	void _limparDados(){
		setState((){
			dadosSalvos.clear();
			_reset();
		});
	}
	_reset(){
		setState(() {
			_nos = 0;
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