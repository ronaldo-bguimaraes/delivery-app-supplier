enum Sexo {
  masculino(0),
  feminino(1),
  outro(2);

  final int value;
  const Sexo(this.value);

  static Sexo getByValue(int? value) {
    return Sexo.values.firstWhere(
      (e) => e.value == value,
      orElse: () => Sexo.masculino,
    );
  }
}
