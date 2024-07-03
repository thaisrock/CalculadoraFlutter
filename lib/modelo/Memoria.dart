class Memoria {
  static const operacoes = ['%', '/', 'x', '-', '+', '=', '←'];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String? _operacao;
  String _valor = '0';
  bool _wipeValor = true;
  String? _lastComando;

  bool _isReplacingOperacao(String comando) {
    //Verifica se uma operação está substituindo outra
    return operacoes.contains(_lastComando) &&
        operacoes.contains(comando) &&
        _lastComando != '=' &&
        comando != '=';
  }

  void _setOperacao(String novaOperacao) {
    //define a nova operação que vai ser realizada
    bool isEqualSign = novaOperacao == '=';
    if (_operacao == null) {
      if (!isEqualSign) {
        _operacao = novaOperacao;
        _bufferIndex = 1;
        _wipeValor = true;
      }
    } else {
      // Operação subsequente
      _buffer[0] = _calcular();
      _buffer[1] = 0.0;
      _valor = _buffer[0].toString();
      _valor = _valor.endsWith('.0') ? _valor.split('.')[0] : _valor;
      _operacao = novaOperacao;
      _operacao = isEqualSign ? null : novaOperacao;
      _bufferIndex = isEqualSign ? 0 : 1;
    }
    /*
define a nova operação a ser realizada:*/

    // limpar o display
    _wipeValor = true;
  }

  void _addDigit(String digit) {
    //adiciona um dígito ao valor atual
    // Dar apenas um ponto, substituir o 0 na chamada de outro número
    final isDot = digit == '.';
    final wipeValor = (_valor == '0' && !isDot) || _wipeValor;
    if (isDot && _valor.contains('.') && !wipeValor) {
      return;
    }
    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValor ? emptyValue : _valor;
    _valor = currentValue + digit;
    _wipeValor = false;
    _buffer[_bufferIndex] = double.tryParse(_valor) ?? 0;
  }

  void _alllimpar() {
    //reseta todos os valores e estados da calculadora
    _valor = '0'; // Define o valor da memória como '0'
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operacao = null;
    _wipeValor = true;
  }

  void _apagarUltimoDigito() {
    /* Apaga o último dígito do valor atual: */
    print(_valor);
    if (_valor.isNotEmpty && _valor != '0') {
      _valor = _valor.substring(0, _valor.length - 1);
      if (_valor.isEmpty || _valor == '-') {
        _valor = '0';
      }
    }
  }

  /* recebe um comando um caractere representano um digito, 
operação ou função especial*/
  void applyComando(String comando) {
    if (_isReplacingOperacao(comando)) {
      _operacao = comando;
      return;
    }
    if (comando == 'AC') {
      _alllimpar();
    } else if (comando == '←') {
      _apagarUltimoDigito();
    } else if (operacoes.contains(comando)) {
      _setOperacao(comando);
    } else {
      _addDigit(comando);
    }
    _lastComando = comando;
  }

  double _calcular() {
    switch (_operacao) {
      case '%': // Realiza a operação matematica atual
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      case '=':
        return _buffer[0];
      default:
        return _buffer[0];
    }
  }

  /* _calcular()
Realiza a operação matemática atual:
*/
  String get valor {
    return _valor;
  }
}
/*String get value
Retorna o valor atual da calculadora (_valor).*/