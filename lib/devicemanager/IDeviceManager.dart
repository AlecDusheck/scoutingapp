import 'package:scoutingapp/devicemanager/Device.dart';

abstract class IDeviceManager {

  List<Device> _connectedDevices;

  IDeviceManager() {
    this._connectedDevices = [];
  }

  Future<void> init();

  List<Device> get connectedDevices => _connectedDevices;

  set connectedDevices(List<Device> value) {
    _connectedDevices = value;
  }
}