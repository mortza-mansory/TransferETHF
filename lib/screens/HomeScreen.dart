import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transfereth/controllers/transferController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransferController());
    final amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Send ETH")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration:  InputDecoration(
                labelText: "Put a account address here",
              ),
              onChanged: controller.setAddress,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: "How many ETH TO SEND?",
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.send(amountController.text);
              },
              child: const Text("Send ETH"),
            ),
            const SizedBox(height: 20),
            Obx(() => Text("Tx Hash: ${controller.txHash}")),
          ],
        ),
      ),
    );
  }
}