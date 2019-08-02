class Device {

  String _name;
  String _commonName;
  bool _connected;

  Device(String name, String commonName, bool connected) {
    this._name = name;
    this._commonName = commonName;
    this._connected = connected;

  }

  String get name => _name;
  String get commonName => _commonName;
  bool get connected => _connected;
}