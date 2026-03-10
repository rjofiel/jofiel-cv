# Jofiel CV - Plantilla Awesome-CV

Plantilla de Currículum Vitae basada en [Awesome-CV](https://github.com/posquit0/Awesome-CV), adaptada para generar documentos PDF profesionales mediante LaTeX y XeLaTeX.

## Requisitos

### Distribución LaTeX
Necesitas tener instalada una distribución de LaTeX compatible con XeLaTeX:
- **Linux**: TeX Live
- **macOS**: MacTeX
- **Windows**: MiKTeX o TeX Live

### XeLaTeX
El motor de compilación requerido es XeLaTeX, que permite el uso de fuentes OpenType y UTF-8.

## Instalación por Sistema Operativo

### Linux (Debian/Ubuntu)
```bash
sudo apt-get update
sudo apt-get install texlive-xetex
```

### macOS
```bash
brew install --cask mactex
```
O descarga MacTeX desde: https://www.tug.org/mactex/

### Windows
Descarga e instala MiKTeX desde: https://miktex.org/
O TeX Live desde: https://www.tug.org/texlive/

## Compilación

Desde la raíz del proyecto, ejecuta:

```bash
xelatex curriculum.tex
```

Esto generará `curriculum.pdf` con tu CV actualizado.

## Estructura del Proyecto

```
jofiel-cv/
├── curriculum.tex          # Archivo principal del CV
├── awesome-cv.cls         # Clase LaTeX de la plantilla
├── content/               # Secciones del CV
│   ├── about-me.tex       # Información personal (actualmente comentada)
│   ├── experiences.tex    # Experiencia laboral
│   ├── aptitude.tex       # Aptitudes y competencias
│   ├── education.tex      # Formación académica
│   └── skills.tex         # Habilidades técnicas
├── pictures/              # Imágenes y fotos
│   ├── profile.jpg        # Foto de perfil
│   ├── profile_old.jpg    # Foto anterior
│   └── profile_old_2.jpg  # Foto anterior
└── LICENSE                # Licencia del proyecto
```

## Cómo Editar Cada Sección

Cada archivo `.tex` dentro de la carpeta `content/` corresponde a una sección del CV. Para modificar una sección, edita el archivo correspondiente:

| Sección | Archivo | Descripción |
|---------|---------|-------------|
| Acerca de mí | `content/about-me.tex` | Descripción personal y resumen profesional |
| Experiencia | `content/experiences.tex` | Historial laboral y experiencia profesional |
| Aptitudes | `content/aptitude.tex` | Competencias blandas y habilidades interpersonales |
| Educación | `content/education.tex` | Formación académica y certificaciones |
| Habilidades | `content/skills.tex` | Habilidades técnicas y tecnologías |

### Cambiar Foto de Perfil
1. Coloca tu foto en la carpeta `pictures/`
2. Edita `curriculum.tex` y modifica la línea:
   ```latex
   \photo[circle,noedge,left]{./pictures/profile.jpg}
   ```
   Cambia `profile.jpg` por el nombre de tu archivo.

### Cambiar Información Personal
Edita las variables en la sección `PERSONAL INFORMATION` de `curriculum.tex`:
```latex
\name{Nombre}{Apellido}
\position{Desarrollador{\enskip\cdotp\enskip}Front-end}
\address{Ciudad}
\mobile{Número de teléfono}
\email{correo@ejemplo.com}
\github{usuario}
\linkedin{usuario}
```

## Consejos para Compilación

### Errores Comunes
- **"File not found"**: Verifica que las rutas en `\input{}` y `\photo{}` sean correctas
- **Encoding issues**: Asegúrate de guardar todos los archivos en UTF-8
- **Missing packages**: Actualiza tu distribución LaTeX con el gestor de paquetes

### Editores Recomendados
- **VS Code** con extensión LaTeX Workshop
- **TeXstudio**: Editor LaTeX multiplataforma
- **OverLeaf**: Editor online (útil para compilación en la nube)

## Licencia

Este proyecto está licenciado bajo Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0).

La plantilla original es Awesome-CV de [posquit0](https://github.com/posquit0/Awesome-CV).

---

¡Edita los archivos en `content/` y personaliza tu CV!
