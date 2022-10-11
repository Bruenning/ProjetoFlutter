import 'package:flutter/material.dart';
import 'package:trabalho_flutter/Dados/Dados.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Widgets{

	static Text text(
		String texto,
		{
			Color cor = Colors.white,
			double tamFont = 18,
			TextAlign alinhamento = TextAlign.start,
			FontWeight negrito = FontWeight.normal,
			FontStyle italico = FontStyle.normal,
			TextDecoration sublinhado = TextDecoration.none
		}
	){
		return Text(
			texto,
			style: TextStyle(
				color: cor,
				fontSize: tamFont,
				fontWeight: negrito,
				fontStyle: italico,
				decoration:sublinhado
			),
			textAlign: alinhamento,
		);
	}
	
	static TextFormField textFormField(
		String label,
		bool usarPadrao,
		String save,
		String controller,

		{
			bool autofoco = false,
			Color cor = Colors.white,
			double tamFont = 18,
			TextAlign alinhamento = TextAlign.start,
			FontWeight negrito = FontWeight.normal,
			FontStyle italico = FontStyle.normal,
			TextDecoration sublinhado = TextDecoration.none,
			Color foco = Colors.white,
			Color hover = Colors.white,
			IconData icone = Icons.person,
			TextInputType type = TextInputType.text,
			
		}
	){
		return TextFormField(
			autofocus: autofoco,
			keyboardType: type,
			controller: TextEditingController(text: controller),
			style: TextStyle(
				color: cor,
				fontSize: tamFont,
			),
			decoration: InputDecoration(
				labelText: label,
				fillColor: foco,
				focusColor: foco,
				hoverColor: hover,
				errorStyle: const TextStyle (color: Colors.red),
				icon: Icon(icone, color: cor), 
				labelStyle: TextStyle(
					color: cor,
					fontSize: tamFont,
					fontWeight: negrito,
					fontStyle: italico,
					decoration:sublinhado
				),
				focusedBorder: UnderlineInputBorder(
					borderSide: BorderSide(
						color: cor,
						width: 1,
					)
				),
			),
			onSaved: (newValor)=>{
				if(newValor != null){
					if(save == "nos"){
						Dados.jogo.nameNos = newValor,
            salvar(newValor, "nameNos")

          }else{
						Dados.jogo.nameEles = newValor,
            salvar(newValor, "nameEles")
          }
        }
			},
			// ignore: body_might_complete_normally_nullable
			validator: (value){
				if ((value == null || value.isEmpty) && !usarPadrao) {
					return 'Por favor, insira um nome';
				}
				return null;
			},
		);
	}

  static void snackBar(BuildContext context, String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(s),
      duration: const Duration(seconds: 2),
    ));
  }

  static void salvar(String texto, String key) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, texto);
  }
}