import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';
import 'dart:math';

void main() {
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Alan",
      account:
      Account(name: "Antonio Alan", balance: 777, isAuthenticated: true));

  bankController.addAccount(
      id: "Victoria",
      account:
      Account(name: "Victoria Tricya", balance: 525, isAuthenticated: true));

  // Fazendo transferência
  try{
    bool result = bankController.makeTransfer(
        idSender: "Victoria", idReceiver: "Alan", amount: 150);
    // Observando resultado
    if(result) {
      print("Transação concluída com sucesso");
    }
  } on SenderIdInvalidException catch(e) {
    print(e);
    print("O ID '${e.idSender}' do remetente não é um ID válido.");
  } on ReceiverIdInvalidException catch(e) {
    print(e);
    print("O ID '${e.idReceiver}' do destinatário não é um ID válido.");
  } on SenderNotAuthenticatedException catch(e) {
    print(e);
    print("O remetente de ID '${e.idSender}' não está autenticado.");
  } on SenderBalanceLowerThanAmountException catch(e) {
    print(e);
    print("O usuário de ID '${e.idSender}' tentou enviar ${e.amount}, porem, em sua conta tem o valor inferior de ${e.senderBalance}");
  } on Exception {
    print("OPS, algo deu errado.");
  }
}

void testandoNullSafety() {
  Account? myAccount = Account(name: "Alan", balance: 7000, isAuthenticated: true);

  Random rng = Random();
  int randomNumber = rng.nextInt(10);
  if(randomNumber <= 5) {
    myAccount.createdAt = DateTime.now();
  }
  print(myAccount.runtimeType);
  // if(myAccount != null) {
  //   print(myAccount.balance);
  // }else {
  //   print("Conta nula");
  // }
  //Operador ternario
  // print(myAccount != null ? myAccount.balance : "Conta nula");
  //Chamada segura
  // print(myAccount?.balance);
}