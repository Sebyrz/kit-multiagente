---
name: armar-taller
description: Use when someone wants to set up a folder where several AI agents (Claude Code, Codex, Cursor, DeepSeek, Gemini) work together without stepping on each other — "arma el taller", "set up the multi-agent kit", "instala el kit multiagente", "quiero que varios agentes trabajen en esta carpeta", "ordena mi carpeta para agentes". Creates AGENTS.md, CLAUDE.md, PARA-CLAUDE.md, BITACORA.md, CONSTANTES.md and README.md (the map), filled in with the owner by reading the folder and asking.
---

# Armar el taller

El objetivo: que cualquier agente que abra esta carpeta sepa en dos minutos quién manda, qué hay,
qué reglas no se rompen y qué hizo la sesión anterior.

Plantillas: `<carpeta base de este skill>/../../plantillas/`. Script: `../../instalar.sh`.

## Pasos

1. **Mira la carpeta** antes de preguntar nada: proyectos (cada subcarpeta con su repo, README o
   `package.json`), si hay `AGENTS.md`, `CLAUDE.md`, `.cursorrules` o bitácoras que ya existan, ramas
   sucias o atrasadas (`git status`, `git log origin/main..` en cada repo). Lo que ya existe se
   respeta: **nunca pises un archivo**. Si ya hay un `AGENTS.md` o un `CLAUDE.md`, propón qué sumarle.
2. **Copia las plantillas que faltan:** `bash <base>/../../instalar.sh "<carpeta>"`.
3. **Entrevista al dueño, una pregunta a la vez**, proponiendo la respuesta a partir de lo que leíste:
   - ¿Qué agentes usa y cuál es el arquitecto? (Por defecto Claude. Si es otro, cambia el nombre en
     `AGENTS.md` y renombra `PARA-CLAUDE.md`.)
   - ¿Qué no se puede hacer nunca sin su OK? (enviar correos, deploy a producción, tocar la planilla
     del equipo, publicar...). Esas van como reglas duras.
   - ¿Cómo se prueba cada proyecto? (`npm test`, `pytest`...). Va en "Pruebas en verde".
   - ¿Qué es lo que no cambia? (objetivo, decisiones, voz, permisos) → `CONSTANTES.md`.
   - Idioma y tono de los commits y los docs.
4. **Llena `README.md` (el mapa):** quién trabaja, tabla de proyectos con estado y bitácora, dónde
   viven los secretos, producción y los datos que son la verdad. Solo lo que viste o te dijo.
5. **Primera entrada de `BITACORA.md`** con lo que encontraste (incluidos checkouts sucios o atrasados).
6. **Cierra** mostrando qué archivos creaste y qué quedó con `<!-- -->` por llenar.

## Reglas

- No inventes proyectos, reglas ni decisiones: lo que no sabes, lo preguntas o lo dejas marcado.
- Nada de secretos en estos archivos (se leen en cada sesión y suelen ir al repo).
- Si la carpeta no es un repo, no hagas `git init` sin preguntar.
