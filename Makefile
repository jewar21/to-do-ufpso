.PHONY: run test clean build

# Ejecuta la aplicación
run:
	flutter run

# Ejecuta las pruebas unitarias
test:
	flutter test

# Limpia los archivos temporales y el caché de dependencias
clean:
	flutter clean
	flutter pub get

# Construye la aplicación (por defecto para Android)
build-apk:
	flutter build apk
