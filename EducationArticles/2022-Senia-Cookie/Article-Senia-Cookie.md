---
title: "SMX y el Mantenimiento: Capítulo 1"
author: [Departamento de Informática del IES La Senia]
date: "2022-02-17"
subject: "Markdown"
keywords: [SMX,ABS,GNU, Software Libre]
subtitle: "Fomentando la integración"
lang: "es"
page-background: "../rsrc/backgrounds/background-senia.pdf"
page-background-opacity: 1
titlepage: true,
titlepage-text-color: "000000"
titlepage-rule-color: "360049"
titlepage-rule-height: 0
titlepage-background: "../rsrc/backgrounds/background-cover.pdf"
bibliography: "./senia-cookie-references.bib"
output:
  pdf_document:
    citation_package: natbib
---

\tableofcontents

\newpage
# Introducción

En este pequeño artículo se presenta una experiencia llevada a cabo por el Departamento de Informática del IES La Sénia de Paiporta 
en el que se describe como el Alumnado del primer curso de Grado Medio del Ciclo de Sistemas Microinformáticos y Redes, lleva a cabo 
en el centro un pequeño desarrollo de una herramienta destinada a mejorar el mantenimiento y asistencia de los Ordenadores del IES.

A lo largo del artículo se describe cuales son algunas de las metodologías de trabajo que el profesorado del ciclo lleva a cabo con los alumnos y cómo 
se pueden mejorar y *afinar* las herramientas para adecuarlas al entorno de trabajo.

Por último se describen algunas de las *Unidades de Competencia* que se han puesto en marcha a la hora de detectar/desarrollar e implementar
el proyecto, así como una serie de actividades que podrían llevarse a cabo para seguir trabajando con el alumnado.

\newpage
# SMX y el Mantenimiento

Una de las filosofías principales del IES La Sénia es poner el alumnado en el centro de la educación, dándole protagonismo y permitiendo que 
forme parte activa y crítica de la comunidad educativa a la que pertenece.

Dentro de esta filosofía y teniendo en cuenta los Cuatro Saberes Fundamentales de la Formación Profesional:

- *Saber* 
- *Saber hacer*
- *Saber estar*
- *Saber ser*

Se tomó la decisión de fomentar que las incidencias técnicas que tienen lugar a diario en el IES sean resueltas (con apoyo, si es necesario) por el alumnado de Grado Medio.

En la resolución de estas incidencias el alumnado *debe* poner en juego lo aprendido durante el curso en los diferentes módulos que integran el ciclo. Algunos de los procesos cognitivos y técnicos que se ponen en juego en la resolución de este tipo de situaciones son los siguientes:

- Trato con el personal (docente o alumnado) que ha detectado la incidencia o la ha causado (*saber estar*).
- Análisis del problema.
- Reproducibilidad del mismo (uno de los primeros pasos para poder solventar cualquier problema).
- Elaboración de Hipótesis de solución, a partir de los conocimientos adquiridos (*saber*).
- Puesta en marcha de una solución (*saber hacer*). 
- Pruebas y detección de errores (*saber hacer*).
- Aceptación de la solución y propuestas de mejora (*saber ser*).

En este proceso, el alumnado toma conciencia de las diferentes problemáticas que se tienen con el uso de la tecnología, le permite tomar decisiones, desarrolla la creatividad, el análisis de la situación y pone en juego *en la práctica* los conceptos que se le han ido presentando en los diferentes módulos.

El verdadero potencial de esta actividad consiste en que el alumnado se transforma en un agente activo de su mundo, al tener la responsabilidad de mejorarlo no sólo para si mismo, sino para la comunidad que le rodea. Esta responsabilidad hace útil lo aprendido, más allá de tareas entregables, examenes, y *kahoots*. El alumnado está *mejorando su entorno*, utilizando *lo que él sabe* y *lo que sabe hacer*. 

Este tipo de aprendizaje, también conocido como  *Aprendizaje Basado en Servicios* (ABS), va más allá del famoso *Aprendizaje Basado en Proyectos* (ABP) y forma parte de las metodologías más efectivas que se pueden realizar.[@puig2007]

Desde el Departamento de Informática llevamos varios años poniéndolo en práctica con el alumnado y participando en diferentes proyectos de colaboración con *ONGs* y Fundaciones.

En este pequeño artículo tan sólo trataremos el desarrollo de una pequeña propuesta, pero esperamos que sirva de ejemplo de todo lo que este tipo de implicación puede aportar a la práctica educativa.

Es importante destacar que en todo el IES utilizamos GNU/LinuX como distribución en todos los ordenadores, así que las herramientas que se describen y utilizan son de acceso gratuito y libre, reduciendo la brecha digital y fomentando la curiosidad y los valores del Software Libre dentro de la Comunidad Educativa[@adell2007software].

\newpage
# Detectando el problema

Durante las labores de resolución de incidencias, una de las primeras tareas a realizar en cada una de las intervenciones es la obtención de la **Dirección IP** del equipo que presenta el problema. Esto permite al alumnado una posibilidad de realizar la *asistencia* sin tener que estar en la clase y poder hacerlo de manera *remota* desde su ordenador del Aula.

Esto se consigue utilizando *SSH*, la herramienta que permite a todo el centro estar mantenido y actualizado con un mínimo de personal y sin tener que estar físicamente en el aula que presenta el problema, haciendo el trabajo del técnico de manera *invisible*, pero *efectiva*.

En esa obtención de la IP, el alumno ha de iniciar sesión en el equipo y ejecutar alguna orden desde consola (*lo más rápido*), o comprobar mediante alguna herramienta gráfica, cuál es la IP del equipo. 

Esto pueden ser algunos segundos, pero cuando la incidencia requiere comprobar las direcciones IP de toda una fila de ordenadores, estar iniciando sesión en cada uno de ellos, para salir una vez hemos obtenido la IP puede resultar una tarea repetitiva y tediosa. Y al más puro estilo español, que *agudiza el ingenio* cuando a trabajar menos se refiere, a algunos alumnos se les ocurrió la idea de que la IP apareciera en la pantalla de inicio de sesión, antes de que el usuario tuviera que iniciar sesión en el equipo.

Con esta solución, podemos comprobar rápidamente situaciones cómo:

- La IP asignada está dentro del Rango del DHCP.
- El estado de la conectividad del cable.
- El nombre del equipo.
- 

\newpage
# Proponiendo la mejora



\newpage
# Implementando la mejora

\newpage
# Pruebas

\newpage
# Unidades de Competencia

\newpage
# Conclusiones

\newpage
# Posibles actividades adicionales

\newpage
# Bibliografia
