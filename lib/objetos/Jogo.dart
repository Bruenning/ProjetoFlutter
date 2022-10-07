class Jogo{

	int _nos = 0;
	int _eles = 0;
	int _multitruco = 0;
	bool _isTruco = false;
	bool _fim = false;
	String _nameNos ="";
	String _nameEles ="";

	int get nos => _nos;
	int get eles => _eles;
	int get multitruco => _multitruco;
	bool get isTruco => _isTruco;
	bool get fim => _fim;
	String get nameNos => _nameNos;
	String get nameEles => _nameEles;

	set nos(int value) {
		_nos = value;
	}

	set eles(int value) {
		_eles = value;
	}

	set multitruco(int value) {
		_multitruco = value;
	}

	set isTruco(bool value) {
		_isTruco = value;
	}

	set fim(bool value) {
		_fim = value;
	}

	set nameNos(String value) {
		_nameNos = value;
	}

	set nameEles(String value) {
		_nameEles = value;
	}

	@override
	String toString() {
		return 'Jogo{_nos: $_nos, _eles: $_eles, _multitruco: $_multitruco, _isTruco: $_isTruco, _fim: $_fim, _nameNos: $_nameNos, _nameEles: $_nameEles}';
	}

}