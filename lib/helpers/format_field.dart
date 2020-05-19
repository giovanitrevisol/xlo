///essa funcao remove qualquer valor que nao sena um nr
///dentro de uma String
String getSanitizedText(String text) {
  return text.replaceAll(RegExp(r'[^\d]'), '');
}
