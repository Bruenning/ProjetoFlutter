// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:trabalho_flutter/Dados/Dados.dart';
import 'package:trabalho_flutter/components/Widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

//home do placar do truco

	const List<String> truco = <String>['Truco', 'Seis', 'Nove', 'Doze', 'Maximo'];
	String dropdownValue = truco.first;
	

class HomePage extends StatefulWidget {

  	const HomePage({super.key});

	@override
	State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
	final DateFormat formatter = DateFormat('dd/mm mm:ss');

	
	_ganhoNos(){
		setState(() {
			if(Dados.jogo.nos == 0 && Dados.jogo.eles == 0) {
			  Dados.dadosSalvos.add("\n---------------------------------\n\nNovo Jogo");
			}
			if(Dados.jogo.isTruco && !Dados.jogo.fim && Dados.jogo.nos < 11){
				late int valor = (Dados.jogo.nos +( 3 * Dados.jogo.multitruco));

				if(valor > 12){
					Dados.jogo.nos = 12;
				}else{
					Dados.jogo.nos = valor;
				}
				Dados.dadosSalvos.add("\nNós: ${Dados.jogo.nos} Eles: ${Dados.jogo.eles}, no horario: ${formatter.format(DateTime.now())}");

			}
			else if(Dados.jogo.nos == 11 && Dados.jogo.isTruco && !Dados.jogo.fim){
				Dados.jogo.fim = true;
				Dados.dadosSalvos.add("\nFim de Jogo: Nós ganharam\nA proxima não seja burro em pedir truco em mão de 11\n");

			}else if(!Dados.jogo.fim){
				Dados.jogo.nos++;
				Dados.dadosSalvos.add("\nNós: ${Dados.jogo.nos} Eles: ${Dados.jogo.eles}, no horario: ${formatter.format(DateTime.now())}");

			}

			Dados.jogo.multitruco = 0;
			Dados.jogo.isTruco = false;
			
			if(Dados.jogo.nos >= 12){
				Dados.jogo.fim = true;
				Dados.dadosSalvos.add("\nFim de Jogo: Nós ganharam");
			}

		});
	}

	_ganhoEles(){
		setState(() {
			if(Dados.jogo.nos == 0 && Dados.jogo.eles == 0){
				Dados.dadosSalvos.add("\n---------------------------------\n\nNovo Jogo");
			}
			if(Dados.jogo.isTruco && !Dados.jogo.fim && Dados.jogo.eles < 11){
				late int valor = (Dados.jogo.eles +( 3 * Dados.jogo.multitruco));

				if(valor > 12){
					Dados.jogo.nos = 12;
				}else{
					Dados.jogo.eles = valor;
				}
				Dados.dadosSalvos.add("\nNos: ${Dados.jogo.nos} Eles: ${Dados.jogo.eles}, no horario: ${formatter.format(DateTime.now())}");
			}
			else if(Dados.jogo.eles == 11 && Dados.jogo.isTruco && !Dados.jogo.fim){
				Dados.jogo.fim = true;
				Dados.dadosSalvos.add("\nFim de Jogo: Eles ganharam\nA proxima não seja burro em pedir truco em mão de 11\n");

			}
			else if(!Dados.jogo.fim){
				Dados.jogo.eles++;
				Dados.dadosSalvos.add("\nNos: ${Dados.jogo.nos} Eles: ${Dados.jogo.eles}, no horario: ${formatter.format(DateTime.now())}");
			}
			Dados.jogo.multitruco = 0;
			Dados.jogo.isTruco = false;
			

			if(Dados.jogo.eles >= 12){
				Dados.jogo.fim = true;
				Dados.dadosSalvos.add("\nFim de Jogo: Eles ganharam\n");
			}

		});
	}
	String _estado(tipo){
		String valor = "";
		setState(() {
		  switch (tipo) {
			case "nos":
				valor = Dados.jogo.nos.toString();
				break;
			case "eles":
				valor = Dados.jogo.eles.toString();
				break;

			}
		});

		return valor;
	}

	_truco(int multiplicador){
		setState(() {
			if(!Dados.jogo.fim && Dados.jogo.multitruco <= 3){
				Dados.jogo.multitruco = multiplicador++;
				Dados.jogo.isTruco = true;
			}
		});
	}

	reset(){
		setState(() {
			Dados.reset();
		});
	}

	@override 
	Widget build(BuildContext context) {
		// ignore: non_constant_identifier_names
		_showIt(Mensagem, burro) => showDialog(
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
							Widgets.text(Mensagem, tamFont: 36),
							Widgets.text(burro, tamFont: 22)
						]
				),
				actions: [
				ElevatedButton(
					child: Widgets.text("Iniciar novamente? "),
					onPressed: () {
						reset();
						Navigator.of(context).pop();
					})
				]);
		});
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
									child: Widgets.text("Nós: ${_estado("nos")}", tamFont: 43, alinhamento: TextAlign.center)
								),
								BootstrapCol(
									sizes:'col-6',
									child: Widgets.text("Eles: ${_estado("eles")}", tamFont: 43, alinhamento: TextAlign.center)
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
											children: <Widget>[
												const Tab(icon: Icon(Icons.add)),
												Widgets.text("Nós", tamFont: 16, alinhamento: TextAlign.center)
											],
										),
										onPressed:(){
											_ganhoNos();
											if(Dados.jogo.fim && Dados.jogo.nos == 11){
												_showIt("O vencedor foi: Eles","A proxima não seja burro em pedir truco em mão de 11");
											}
											else if(Dados.jogo.fim){
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
											children: <Widget>[
												const Tab(icon: Icon(Icons.add)),
												Widgets.text("Eles", tamFont: 16, alinhamento: TextAlign.center)
											],
										),
										onPressed:(){
											_ganhoEles();
											if(Dados.jogo.fim && Dados.jogo.eles == 11){
												_showIt("O vencedor foi: Nós","A proxima não seja burro em pedir truco em mão de 11");
											}
											else if(Dados.jogo.fim){
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
									sizes:'col-12',
									child:ElevatedButton(
										onPressed:(){
											_truco(Dados.jogo.multitruco+1);
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
													child:	Widgets.text("Aumentar: ${truco.elementAt(Dados.jogo.multitruco)}", tamFont: 16, alinhamento: TextAlign.center)
												),
												BootstrapCol(
													child:Dados.jogo.multitruco != 0 ? Widgets.text("Está em: ${truco.elementAt(Dados.jogo.multitruco-1)}", cor:Colors.white, tamFont: 16, alinhamento: TextAlign.center) : Widgets.text("Está em Normal", cor:Colors.white, tamFont: 16, alinhamento: TextAlign.center)
												)
												
											],
										)
									)
								),
							]
						)
						
					],
				)
		);
	}
}
