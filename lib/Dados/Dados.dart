import 'package:trabalho_flutter/objetos/Jogo.dart';

class Dados{

	static List<String> dadosSalvos = <String>[];
	static Jogo jogo = Jogo();
	
	static reset(){
		jogo.eles = 0;
		jogo.nos = 0;
		jogo.multitruco = 0;
		jogo.isTruco = false;
		jogo.fim = false;
	}


	@override
	String toString() {
		late StringBuffer dados = StringBuffer();

		for (var element in dadosSalvos) {
			dados.write(element);
			dados.write('\n');
		}

		return dados.toString();
	}
}