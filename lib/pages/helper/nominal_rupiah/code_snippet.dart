String codeSnippetNominalRupiah = '''String getNominalRupiah(int money){
  
  final unit = <String>["","satu","dua","tiga","empat","lima","enam","tujuh","delapan","sembilan","sepuluh","sebelas"];
  String result = "";
  
  if (money > 999999999999) {
    result = "\${getNominalRupiah(money ~/ 1000000000000)} triliun \${getNominalRupiah(money % 1000000000000)}";
  } else if (money > 999999999) {
    result = "\${getNominalRupiah(money ~/ 1000000000)} milyar \${getNominalRupiah(money % 1000000000)}";
  } else if (money > 999999){
    result = "\${getNominalRupiah(money ~/ 1000000)} juta \${getNominalRupiah(money % 1000000)}";
  } else if (money > 1999) {
    result = "\${getNominalRupiah(money ~/ 1000)} ribu \${getNominalRupiah(money % 1000)}";
  } else if (money > 999) {
    result = "seribu \${getNominalRupiah(money % 1000)}";
  } else if (money > 199) {
    result = "\${getNominalRupiah(money ~/ 100)} ratus \${getNominalRupiah(money % 100)}";
  } else if (money > 99) {
    result = "seratus \${getNominalRupiah(money % 100)}";
  } else if (money > 19) {
    result = "\${getNominalRupiah(money ~/ 10)} puluh \${unit[(money % 10)]}";
  } else if (money > 11) {
    result = "\${unit[(money % 10)]} belas";
  } else {
    result = unit[money];
  }
  
  return result.replaceAll(RegExp("\\s+")," ");
  
}

''';
