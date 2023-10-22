import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);
}

void main() {
  print("Calculadora de IMC");

  try {
    stdout.write("Digite o seu nome: ");
    String nome = stdin.readLineSync() ?? "";

    stdout.write("Digite o seu peso (em kg): ");
    double peso = double.parse(stdin.readLineSync() ?? "0");

    stdout.write("Digite a sua altura (em metros): ");
    double altura = double.parse(stdin.readLineSync() ?? "0");

    Pessoa pessoa = Pessoa(nome, peso, altura);
    double imc = calcularIMC(pessoa);

    print("\nResultado:");
    print("Nome: ${pessoa.nome}");
    print("Peso: ${pessoa.peso} kg");
    print("Altura: ${pessoa.altura} m");
    print("IMC: $imc");
    print("Classificação: ${classificarIMC(imc)}");
  } catch (e) {
    print("Erro: Insira valores válidos para peso e altura.");
  }
}

double calcularIMC(Pessoa pessoa) {
  if (pessoa.altura <= 0) {
    throw Exception("A altura deve ser maior que zero.");
  }
  return pessoa.peso / (pessoa.altura * pessoa.altura);
}

String classificarIMC(double imc) {
  if (imc < 18.5) {
    return "Abaixo do peso";
  } else if (imc < 24.9) {
    return "Peso normal";
  } else if (imc < 29.9) {
    return "Sobrepeso";
  } else if (imc < 34.9) {
    return "Obesidade grau 1";
  } else if (imc < 39.9) {
    return "Obesidade grau 2";
  } else {
    return "Obesidade grau 3";
  }
}
