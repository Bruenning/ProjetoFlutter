// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'Jogo.dart';

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