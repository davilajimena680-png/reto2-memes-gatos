# Reto 2: Generador de Memes de Gatos con Filtros

App Flutter que consume la API de [Cataas](https://cataas.com) (Cats as a Service).
El usuario escribe una frase y esta aparece sobre la foto de un gato aleatorio.
Tambien puede aplicar filtros (blanco y negro, sepia, negativo, desenfoque, pintura, pixelado).

La API recibe el texto y el filtro por la URL:

```
https://cataas.com/cat/says/Hola%20mundo?filter=sepia&fontSize=40&fontColor=white&width=600&t=<seed>
```

## Arquitectura

Clean Architecture con tres capas. La dependencia siempre apunta hacia `domain`.

```
lib/
├── core/constants/api_constants.dart
├── features/cat_meme/
│   ├── domain/
│   │   ├── entities/         (CatMeme, CatFilter)
│   │   ├── repositories/     (CatMemeRepository, contrato)
│   │   └── usecases/         (BuildCatMemeUrl)
│   ├── data/
│   │   ├── datasources/      (CatMemeRemoteDataSource: arma la URL)
│   │   └── repositories/     (CatMemeRepositoryImpl)
│   └── presentation/
│       ├── providers/        (CatMemeProvider, estado con Provider)
│       ├── pages/            (CatMemePage)
│       └── widgets/          (MemeImage, FilterSelector)
└── main.dart                 (inyeccion de dependencias)
```

Cataas devuelve la imagen directamente, por eso no hay JSON ni modelos:
el datasource solo construye la `Uri` y `Image.network` descarga la foto.

## Como ejecutarlo

Este repositorio contiene solo el codigo (`lib/`, `test/`, `pubspec.yaml`).
Genera las carpetas de plataforma con Flutter dentro de esta misma carpeta:

```bash
flutter create . --project-name reto2_memes_gatos --platforms=android,ios
flutter pub get
```

### Permiso de internet en Android

Abre `android/app/src/main/AndroidManifest.xml` y agrega, arriba de `<application>`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

(En debug suele funcionar sin el, pero en release la app no tendria conexion.)

### Correr en el telefono

1. Activa las opciones de desarrollador y la depuracion USB.
2. Conecta el telefono y verifica con `flutter devices`.
3. Ejecuta `flutter run`.

### Pruebas

```bash
flutter test
```

## Capturas

_Agrega aqui capturas de la app funcionando._
