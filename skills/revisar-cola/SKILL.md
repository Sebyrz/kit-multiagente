---
name: revisar-cola
description: Use when Claude (the architect) opens a folder that uses the multi-agent kit and PARA-CLAUDE.md has items under "Pendiente", or when asked to "revisa la cola", "revisa lo que hizo DeepSeek/Codex/Cursor", "qué dejaron los otros agentes", "review pending changes". Reviews each pending change cold, with evidence (diff, tests), closes it with a one-line verdict, and raises the decisions that belong to the owner.
---

# Revisar la cola

Lo que otro agente dejó en `PARA-CLAUDE.md` se revisa **antes** de seguir construyendo encima.

## Por cada entrada pendiente (de la más antigua a la más nueva)

1. **Lee lo que dice que hizo** y después **míralo**: `git log`, `git diff`, los archivos nombrados.
   La entrada es un reporte, no una prueba.
2. **Revisa en frío:**
   - ¿Hace lo que dice? Corre las pruebas del proyecto.
   - ¿Choca con `AGENTS.md`, `CONSTANTES.md` o las reglas del proyecto?
   - ¿Toca algo que llega a producción, a clientes o a datos reales?
   - ¿Hay un supuesto sin verificar, una cifra sin fuente o un secreto en el repo?
   - Cuestiona también el diseño: ¿había una forma más simple o más segura? Compara escenarios con
     costo y riesgo, no con gusto.
3. **Cierra la entrada:** márcala `[x]`, escribe "revisado AAAA-MM-DD · Claude: <veredicto en una
   línea>" y muévela a "Revisado". Si hay que corregir algo, dilo y propón el arreglo; no lo apliques
   por la espalda si es una decisión del dueño.
4. **Decisiones del dueño:** junta las de todas las entradas y pregúntalas al final, una a la vez,
   con opciones y tu recomendación.

## Al terminar

Entrada en `BITACORA.md` con lo revisado, lo corregido y lo que espera al dueño.
