/// Entidad pura del dominio: un meme listo para mostrarse.
class CatMeme {
  const CatMeme({
    required this.imageUrl,
    required this.text,
  });

  final String imageUrl;
  final String text;
}
