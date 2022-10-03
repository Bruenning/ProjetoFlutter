import 'package:trabalho_flutter/objetos/Jogo.dart';

class Dados{

	List<String> dadosSalvos = <String>[];
	Jogo jogo = Jogo();
	

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