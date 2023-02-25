import 'controllers/bank_controller.dart';
import 'models/account.dart';

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
  bool result = bankController.makeTransfer(
      idSender: "Victoria", idReceiver: "Alan", amount: 150);

  // Observando resultado
  print(result);
}