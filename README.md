#Centro Regional Zona Atlántica
##TP2 - Automatización y Scripting
# Trabajo práctico 1: Revisión de conceptos y scripts básicos
- **Materia** Automatización y Scripting
- **Profesores** Ramiro Poggi, Lucas Linquimán
- **Alumna:** Gisella Henriquez  
- **Legajo:** 5225

- ## Objetivo:
Implementar scripts en Bash de nivel intermedio-avanzado, utilizando bucles complejos, arreglos, manipulación de cadenas en variables,
control de procesos con archivos de bloqueo (lockfiles), interacción con servicios web externos mediante cURL, y creación de interfaces interactivas en terminal (select y case)

- ##  Estructura del proyecto
- `codigo/` →  contiene los scripts en Bash
- `logs/` → contiene las salidas generadas por los scripts

- ## Descripción de cada script con su captura
- pdf_version.sh: Busca todos los archivos .pdf en el directorio actual y subdirectorios. Extrae la primera línea para identificar la versión del formato (%PDF-1.X).
Filtra y omite los archivos que contengan la palabra “excluir” o las iniciales del alumno.

<img width="1170" height="577" alt="image" src="https://github.com/user-attachments/assets/79a355f1-8796-4d01-884f-d4cea9a42e09" />

- organizador.sh: organiza archivos por extensión.
<img width="1004" height="781" alt="image" src="https://github.com/user-attachments/assets/89336871-0df6-4889-ac19-17ffb3e0abe1" />


- monitorear.sh: muestra uso de disco y memoria.
<img width="775" height="597" alt="image" src="https://github.com/user-attachments/assets/dfe3ac83-0b3e-4f9d-888d-2d8e6e839df5" />


- chequear_paginas.sh: verifica sitios web desde sitios_CURZA5225.txt.
<img width="740" height="573" alt="image" src="https://github.com/user-attachments/assets/8e0cb965-dee3-4dc9-8929-dec5cd532017" />


- backup_manager.sh: respalda archivos modificados en últimas 24h con lockfile y pausa de 30s.
<img width="840" height="627" alt="image" src="https://github.com/user-attachments/assets/596bad00-ef56-4228-84e7-5cace7301403" />
