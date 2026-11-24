---
name: cerrar-sesion
description: Use at the end of a work session in a folder that uses the multi-agent kit (has AGENTS.md + BITACORA.md + PARA-CLAUDE.md), or when asked to "cierra la sesión", "deja la bitácora al día", "anota lo que hicimos", "wrap up the session", "pásale esto a Claude para revisar". Writes the BITACORA.md entry, adds a PARA-CLAUDE.md review item when needed, updates project logs, and checks nothing was left running.
---

# Cerrar la sesión

Una sesión no termina cuando el código anda: termina cuando la próxima sesión, de cualquier agente,
puede seguir sin preguntarte nada.

## Pasos

1. **Qué pasó de verdad.** Revisa `git status` y `git diff` (o `git log` de la sesión) en cada repo que
   tocaste. La bitácora se escribe desde eso, no de memoria.
2. **Entrada en `BITACORA.md`**, arriba de todo, con el formato del archivo:
   - **Qué:** lo que se hizo, con rutas y PRs.
   - **Prueba:** el comando y el resultado. Si no se probó, se dice: "sin verificar: no había datos de
     prueba". Nunca "funciona" sin prueba.
   - **Pendiente:** lo abierto y de quién depende (del dueño, de otro agente, de un tercero).
3. **¿Hay algo que el arquitecto deba revisar?** Si tú no eres el arquitecto y cambiaste código,
   reglas, datos o algo que llega a producción: entrada en `PARA-CLAUDE.md` bajo "Pendiente", lo más
   nuevo arriba (fecha · quién · qué cambió · qué revisar · qué decidir con el dueño · archivos).
4. **Bitácora del proyecto**, si el proyecto tiene la suya: la misma entrada, con su detalle.
5. **`CONSTANTES.md`**: si el dueño dijo en el chat algo que no cambia (una regla, un objetivo, un
   permiso), anótalo con la fecha.
6. **Nada corriendo:** servidores, procesos en segundo plano, archivos temporales en la carpeta.
7. **Resumen al dueño** en tres líneas: qué quedó, qué no se verificó, qué le toca.

## Reglas

- Lo más nuevo arriba. No reescribas entradas viejas: si algo cambió, entrada nueva que lo diga.
- Una bitácora que miente es peor que ninguna: lo que no se hizo no se anota como hecho.
