-- lua/learn_vim/locales/es/modules/module0.lua
-- Spanish translations for module 0 (placeholders)

return {
    -- Module 0
    module0_title = "Módulo 0: Primeros Pasos Esenciales (es)",

    -- Module 0, Lesson 1
    module0_lesson1_title = "Salir de Vim: Tus Rutas de Escape Esenciales (es)",
    module0_lesson1_explanation = [[
¡Bienvenido a tu primera lección! La habilidad más crucial para cualquier principiante de Vim es saber cómo salir del editor. Es una broma común que la gente queda atrapada en Vim, ¡pero después de esta lección, ese no serás tú!

Vim opera en diferentes modos. Para ingresar comandos como 'quit', necesitas estar en Modo Normal. Si estás en Modo de Inserción (donde escribes texto), presiona `<Esc>` para volver al Modo Normal. Sabrás que estás en Modo Normal cuando las teclas que escribes no aparecen como texto en la pantalla.

Una vez en Modo Normal, escribe `:` para entrar en el modo de línea de comandos. Verás dos puntos aparecer en la parte inferior izquierda de tu pantalla. Aquí están los comandos de salida esenciales:

*   `:q`  - Salir. Este comando cierra el archivo actual o Vim si es el último archivo abierto. Solo funciona si no hay cambios sin guardar. Si hay cambios sin guardar, Vim te dará una advertencia.

*   `:q!` - Salir SIN guardar (el '!' fuerza la acción). Esta es tu salida de emergencia. Si has hecho cambios que no quieres conservar, o simplemente quieres salir, este es el comando a usar.

*   `:wq` - Escribir (guardar) Y salir. Esto guarda tus cambios en el archivo y luego sale de Vim. Es una forma muy común de salir.

*   `:x`  - Escribir y salir (similar a `:wq`). Este comando también guarda los cambios y sale. La sutil diferencia es que `:x` solo escribe el archivo si ha sido modificado, mientras que `:wq` siempre escribirá el archivo (y actualizará su marca de tiempo) incluso si no se realizaron cambios.

Para este tutorial:
- Usa `:LearnVim exc` para verificar tu intento de ejercicio.
- Usa `:LearnVim exr` para reiniciar un ejercicio.
- Estos comandos de salida (`:q`, `:q!`, `:wq`, `:x`) no cerrarán realmente el entorno del tutorial, pero se verificarán como si los hubieras escrito. (es)
]],
    module0_lesson1_exercise1_instruction = "Has realizado algunos cambios imaginarios y quieres salir sin guardar. Escribe `:q!` y presiona <Enter>. Luego escribe `:LearnVim exc` para verificar. (es)",
    module0_lesson1_exercise1_feedback = "¡Correcto! `:q!` es la forma de forzar la salida sin guardar. ¡No estás atrapado! (es)",
    module0_lesson1_exercise2_instruction = "Ahora, imagina que has terminado tu trabajo y quieres guardar y salir. Escribe `:wq` y presiona <Enter>. Luego escribe `:LearnVim exc` para verificar. (es)",
    module0_lesson1_exercise2_feedback = "¡Excelente! `:wq` guarda tu trabajo y sale. ¡Has dominado la salida de Vim! (es)",

    -- Module 0, Lesson 2
    module0_lesson2_title = "Moviéndose: Arriba, Abajo, Izquierda, Derecha (es)",
    module0_lesson2_explanation = [[
¡Ahora que sabes cómo salir, aprendamos a movernos! En el Modo Normal de Vim, no usas el ratón. En su lugar, usas las teclas del teclado para la navegación. Esto puede parecer extraño al principio, pero es mucho más eficiente una vez que te acostumbras, ya que tus manos nunca abandonan el teclado.

Las teclas de movimiento más fundamentales son:

+===================================+
|         MOVIMIENTO BÁSICO DEL CURSOR       |
+===================================+
|                                     |
|              [ k ] ↑                |
|        [ h ] ←     → [ l ]          |
|              [ j ] ↓                |
|                                     |
+-------------------------------------+
| ← [h] Izquierda ↓ [j] Abajo   ↑ [k] Arriba  → [l] Derecha |
+===================================+

*   `h` - mueve el cursor un carácter a la Izquierda.
*   `j` - mueve el cursor una línea hacia Abajo.
*   `k` - mueve el cursor una línea hacia Arriba.
*   `l` - mueve el cursor un carácter a la Derecha.

Piensa en `j` como si tuviera una pequeña flecha apuntando hacia abajo. `k` está arriba de `j`, y `h` y `l` están a la izquierda y derecha en una disposición de teclado estándar.

Requiere práctica, pero esto se convertirá en algo natural. ¡Intenta evitar usar las teclas de flecha! (es)
]],
    module0_lesson2_exercise1_instruction = "Usa h, j, k, l para navegar hasta el carácter '[X]' en el texto de abajo. Una vez que tu cursor esté en '[X]', presiona 'r' (modo reemplazar) y luego 'O' (la letra O mayúscula) para cambiarlo a '[O]'. Presiona <Esc> para volver al modo Normal. Luego escribe :LearnVim exc para verificar. (es)",
    module0_lesson2_exercise1_feedback = "¡Gran trabajo! Has navegado y realizado un cambio con éxito utilizando las teclas de movimiento básicas. (es)",

    -- Module 0, Lesson 3
    module0_lesson3_title = "Saltando Más Lejos: Palabras y Líneas (es)",
    module0_lesson3_explanation = [[
Moverse carácter por carácter con h, j, k, l es fundamental, pero Vim ofrece movimientos más potentes para saltar por tu código más rápido.

+===================================+
|       MOVIMIENTOS DE PALABRA Y LÍNEA         |
+===================================+
|                                     |
|  [ w ] → Saltar al inicio de la siguiente palabra |
|  [ b ] ← Saltar al inicio de la palabra anterior |
|  [ e ] → Saltar al final de la palabra actual|
|                                     |
|  [ 0 ] ↖ Ir al primer carácter no en blanco |
|  [ ^ ] ↖ Ir al primer carácter no en blanco (más preciso) |
|  [ $ ] ↗ Ir a la última columna         |
|                                     |
+-------------------------------------+
|  w  b  e   0  ^  $   – todo en modo Normal |
+===================================+

*   `w` (palabra): Mueve el cursor al principio de la siguiente palabra.
*   `b` (atrás): Mueve el cursor al principio de la palabra anterior.
*   `e` (fin): Mueve el cursor al final de la palabra actual (o de la siguiente si ya está al final).

Para movimientos de línea:
*   `0` (cero): Mueve el cursor al primer carácter de la línea (columna 0).
*   `^` (caret): Mueve el cursor al primer carácter no en blanco de la línea. Esto suele ser más útil que `0`.
*   `$` (dólar): Mueve el cursor al final de la línea.

¡Pruébalos! Aceleran significativamente la navegación dentro de las líneas. (es)
]],
    module0_lesson3_exercise1_instruction = "El cursor comenzará al principio de la segunda línea. Usa 'w' para moverte al principio de la tercera palabra ('several'). Luego escribe 'cw' (cambiar palabra), escribe 'many' y presiona <Esc>. Luego escribe :LearnVim exc para verificar. (es)",
    module0_lesson3_exercise1_feedback = "¡Perfecto! 'w' y 'cw' son una combinación poderosa. (es)",
    module0_lesson3_exercise2_instruction = "El cursor comenzará al principio de la última línea. Usa '$' para moverte al final de la línea (después de '[TARGET_EOL]'). Luego presiona 'a' (añadir), escribe ' ADDED_TEXT' y presiona <Esc>. Luego escribe :LearnVim exc para verificar. (es)",
    module0_lesson3_exercise2_feedback = "¡Excelente! '$' te lleva directamente al final, y 'a' te permite añadir. (es)",

    -- Module 0, Lesson 4
    module0_lesson4_title = "Viendo el Panorama General: Navegando Archivos (es)",
    module0_lesson4_explanation = [[
Moverse por líneas y palabras es genial, pero ¿qué pasa con distancias más grandes? Vim tiene comandos para moverse a través de archivos y pantallas enteras.

+===================================+
|      NAVEGACIÓN A NIVEL DE ARCHIVO         |
+===================================+
|                                     |
|  [ gg ] ↖ Ir a la parte superior del archivo         |
|  [ G  ] ↘ Ir a la parte inferior del archivo      |
|                                     |
|  [Ctrl-f] ↓ Página adelante            |
|  [Ctrl-b] ↑ Página atrás           |
|                                     |
|  [ H ] ↑ Moverse a la parte superior de la pantalla      |
|  [ M ] · Moverse al medio de la pantalla   |
|  [ L ] ↓ Moverse a la parte inferior de la pantalla   |
|                                     |
+-------------------------------------+
|  Comandos de “Borde” vs. Comandos de “Pantalla”   |
+===================================+

Saltos a nivel de archivo:
*   `gg`: Ir a la primera línea del archivo.
*   `G` (Shift + g): Ir a la última línea del archivo. También puedes escribir un número y luego `G` (p. ej., `10G`) para ir a la línea 10.

Paginación:
*   `Ctrl-f` (Control + f): Mueve una pantalla completa hacia Adelante (abajo).
*   `Ctrl-b` (Control + b): Mueve una pantalla completa hacia Atrás (arriba).
(Nota: `Ctrl-d` para media página hacia abajo y `Ctrl-u` para media página hacia arriba también son muy útiles!)

Nivel de pantalla (vista actual):
Estos comandos te mueven dentro de lo que está actualmente visible en tu pantalla.
*   `H` (High): Mueve el cursor a la línea superior de la pantalla.
*   `M` (Middle): Mueve el cursor a la línea media de la pantalla.
*   `L` (Low): Mueve el cursor a la línea inferior de la pantalla.

¡Dominar esto te hará sentir como si estuvieras volando a través de tus archivos! (es)
]],
    module0_lesson4_exercise1_instruction = "Comenzarás en algún lugar en medio de un archivo largo. Ve a la PARTE SUPERIOR del archivo usando 'gg'. La primera línea contiene '=== TOP OF THE FILE ==='. Cambia la 'T' en 'TOP' por 'X'. Presiona <Esc>. Luego escribe :LearnVim exc para verificar. (es)",
    module0_geo_lesson4_exercise1_feedback = "¡Zas! ¡'gg' te lleva directamente a la cima! (es)",
    module0_lesson4_exercise2_instruction = "Comenzarás en algún lugar en el medio. Ve a la PARTE INFERIOR del archivo usando 'G'. La última línea contiene '=== BOTTOM OF THE FILE ==='. Cambia la 'B' en 'BOTTOM' por 'Y'. Presiona <Esc>. Luego escribe :LearnVim exc para verificar. (es)",
    module0_lesson4_exercise2_feedback = "¡Zoom! ¡'G' te deja justo al final! (es)",
    module_lesson4_exercise3_instruction = "Comenzarás en la parte superior del archivo. Desplázate un poco hacia abajo si es necesario para asegurarte de que haya texto por encima y por debajo de tu vista actual. Luego, mueve el cursor a la línea MEDIA de la PANTALLA ACTUAL usando 'M'. La línea debería ser 'This is line 35. [SCREEN_MIDDLE_TARGET]'. Cambia la '[S]' en '[SCREEN_MIDDLE_TARGET]' por '[Z]'. Presiona <Esc>. Luego escribe :LearnVim exc para verificar. (Nota: la línea exacta para 'M' depende del tamaño de tu pantalla, el texto de configuración tiene un marcador). (es)",
    module0_lesson4_exercise3_feedback = "¡Bien hecho! 'M' te ayuda a orientarte rápidamente en la pantalla. (es)",
}
