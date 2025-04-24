import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class EthService {
  late Web3Client client;
  late DeployedContract contract;
  late ContractFunction sendToOwner;

  final String rpcUrl = "http://127.0.0.1:7545";
  final String privateKey = "0x299654ab2cade5ecc0aa7f49e1b3410bf83f88853990bc53c5b9e58987e9c770";
  final String contractAddress = "0x618442c13E82164C168140f2bFCDb84CaA679E2A";

  EthService() {
    client = Web3Client(rpcUrl, Client());
  }

  Future<void> init() async {
    final abiString = await rootBundle.loadString("assets/Transfer.json");
    final abiJson = jsonDecode(abiString);
    contract = DeployedContract(
      ContractAbi.fromJson(jsonEncode(abiJson["abi"]), "Transfer"),
      EthereumAddress.fromHex(contractAddress),
    );
    sendToOwner = contract.function("sendToOwner");
  }

  Future<String> transferEth(BigInt weiAmount) async {
    final credentials = EthPrivateKey.fromHex(privateKey);

    final result = await client.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: sendToOwner,
        parameters: [],
        value: EtherAmount.inWei(weiAmount),
      ),
      chainId: 1337,
    );

    return result; // Transaction hash
  }
}