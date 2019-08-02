import 'package:flutter/services.dart';
import 'package:scoutingapp/devicemanager/Device.dart';
import 'package:scoutingapp/devicemanager/IDeviceManager.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothDeviceManager extends IDeviceManager {
  FlutterBluetoothSerial _bluetooth;
  bool _connected;

  BluetoothDeviceManager() {
    this._connected = false;
    this._bluetooth = FlutterBluetoothSerial.instance;
  }

  Future<void> updateDevices() async {
    List<BluetoothDevice> bluetoothClients = [];
    bluetoothClients = await _bluetooth
        .getBondedDevices(); // We will catch errors later down the chain

    this.connectedDevices = bluetoothClients.map((device) {
      return new Device(device.address, device.name, device.isConnected);
    });
  }

  @override
  Future<void> init() async {
    await this.updateDevices();
  }
}
