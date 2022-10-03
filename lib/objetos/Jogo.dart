class Jogo {
	late int _nos = 0;
	late int _eles = 0;
	late int _multitruco = 0;
	late bool _isTruco = false;
	late bool _fim = false;

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

	int get nos => _nos;
	int get eles => _eles;
	int get multitruco => _multitruco;
	bool get isTruco => _isTruco;
	bool get fim => _fim;
	
}