import '../../../../core/constants/api_constants.dart';

/// Fuente de datos remota. Cataas devuelve la imagen directamente,
/// asi que aqui solo se construye la URL (sin JSON que parsear).
class CatMemeRemoteDataSource {
  const CatMemeRemoteDataSource();

  Uri buildUri({
    required String text,
    required String? filter,
    required int seed,
  }) {
    return Uri(
      scheme: ApiConstants.scheme,
      host: ApiConstants.host,
      // pathSegments codifica espacios, acentos y "/" automaticamente.
      pathSegments: text.isEmpty ? ['cat'] : ['cat', 'says', text],
      queryParameters: {
        if (filter != null) 'filter': filter,
        'fontSize': ApiConstants.defaultFontSize,
        'fontColor': ApiConstants.defaultFontColor,
        'width': ApiConstants.defaultWidth,
        // Parametro "cache buster": fuerza un gato nuevo en cada peticion.
        't': '$seed',
      },
    );
  }
}
