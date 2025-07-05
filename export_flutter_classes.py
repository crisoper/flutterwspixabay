import os

# Ruta de la carpeta 'lib' del proyecto Flutter
lib_folder = 'lib'
# Nombre del archivo de salida
output_file = 'flutter_classes_dump.txt'

with open(output_file, 'w', encoding='utf-8') as outfile:
    # Recorre todos los archivos y subcarpetas dentro de 'lib'
    for root, dirs, files in os.walk(lib_folder):
        for file in files:
            if file.endswith('.dart'):
                file_path = os.path.join(root, file)
                relative_path = os.path.relpath(file_path, lib_folder)

                try:
                    with open(file_path, 'r', encoding='utf-8') as f:
                        content = f.read()

                    # Escribe en el archivo de salida
                    outfile.write(f"// === File: {relative_path} ===\n")
                    outfile.write(content)
                    outfile.write("\n\n")  # Separador entre archivos
                except Exception as e:
                    print(f"Error leyendo {file_path}: {e}")

print(f"Exportación completa. Revisa el archivo '{output_file}'.")
