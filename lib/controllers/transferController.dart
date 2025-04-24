import 'package:get/get.dart';
import '../services/eth_service.dart';

class TransferController extends GetxController {
  final EthService ethService = EthService();
  final addressInput = "".obs;
  final txHash = "".obs;

  @override
  void onInit() async {
    await ethService.init();
    super.onInit();
  }

  void setAddress(String address) {
    addressInput.value = address;
  }

  Future<void> send(String amountText) async {
    try {
      final amount = double.tryParse(amountText);
      if (amount == null || amount <= 0) {
        txHash.value = "Error: Invalid ETH amount";
        return;
      }

      final weiAmount = BigInt.from((amount * 1e18).toInt());
      final hash = await ethService.transferEth(weiAmount);
      txHash.value = hash;
    } catch (e) {
      txHash.value = "Error: $e";
      print("Error sending transaction: $e");
    }
  }
}