enum FormaPagamento {
  dinheiro(0),
  cartaoCredito(1),
  cartaoDebito(2),
  pix(3);

  final int value;
  const FormaPagamento(this.value);

  static FormaPagamento getByValue(int? value) {
    return FormaPagamento.values.firstWhere(
      (e) => e.value == value,
      orElse: () => FormaPagamento.dinheiro,
    );
  }
}
