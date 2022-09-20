enum CondicaoVenda {
  solicitada(0),
  confirmada(1),
  finalizada(2),
  cancelada(3);

  final int value;
  const CondicaoVenda(this.value);

  static CondicaoVenda getByValue(int? value) {
    return CondicaoVenda.values.firstWhere(
      (e) => e.value == value,
      orElse: () => CondicaoVenda.solicitada,
    );
  }
}
