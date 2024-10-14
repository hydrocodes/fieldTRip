# fieldTRip
## 1. Description / Descripcion
[EN] An R package for processing field point hydrological measurements. R in the river workshop.

[ES] Un paquete en R para el procesamiento de mediciones puntuales hidrologicas. Taller de R en el rio.

- prwater: Estimation of potential precipitable water / Estimacion del agua precipitable potencial en una columna de aire.

- nival: Melting water evolution in a snowpack / Evolucion del derretimiento de una capa de nieve.

- horton: Adjustment to the Horton model of an infiltration test / Ajuste al modelo de Horton de una prueba de infiltracion.

- greenampt: Adjustment to the Green-Ampt model of an infiltration test / Ajuste al modelo de Green-Ampt de una prueba de infiltracion.

- gauges: Stream gauge by Sectional velocity method / Aforo de rio por el metodo de velocidad seccional.

- gaugeph: Synthetic rating curve in an ephemeral stream section / Curva de gasto sintetica en una seccion transversal de rio efimero.
  
- wblake: A simple lake water balance  / Balance simple de agua en un lago

## 2. Setup / Instalacion

**a.** In Rstudio, install *remotes* package from CRAN / En Rstudio, instalar el paquete *remotes* del CRAN

**b.** In Rstudio console or on your code, please write / En la consola de Rstudio o en vuestro codigo, escribir

```r
remotes::install_github("hydrocodes/fieldTRip")
```

Example / Ejemplo:
```r
library(fieldTRip)
gauges(data=file, L=15)
```
Please, check tutorial folder for codelines examples and more details:

Por favor, revisa el folder tutorial con ejemplos de codigos y mas detalles

https://github.com/hydrocodes/fieldTRip/tree/main/tutorial

## 3. Credits / Creditos
fieldTRip is developed by Pedro Rau at Water Research and Technology Center of Universidad de Ingenieria y Tecnologia (UTEC-CITA, Lima). For any issue or suggestion please write to: prau@utec.edu.pe  
fieldTRip could be not possible without runnning the next softwares: R (R Core Team, 2020), Rstudio (RStudio Team, 2020).

fieldTRip es desarrollado por Pedro Rau en el Centro de Investigacion y Tecnologia del Agua de la Universidad de Ingenieria y Tecnologia (UTEC-CITA, Lima). Para cualquier duda o sugerencia escribir a: prau@utec.edu.pe  
fieldTRip no seria posible sin ejecutar los siguientes softwares: R (R Core Team, 2020), Rstudio (RStudio Team, 2020).

## 4. Citation / Citacion
Rau P. 2024. fieldTRip. An R package for processing field point hydrological measurements. Github repository https://github.com/hydrocodes/fieldTRip

## 5. References / Referencias
R Core Team, 2020. R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. https://www.R-project.org/

RStudio Team (2020). RStudio: Integrated Development for R. RStudio, PBC, Boston, MA URL http://www.rstudio.com/

## 6. Outputs / Salidas
<img src="https://github.com/hydrocodes/fieldTRip/blob/main/tutorial/fieldtrip_fig1.PNG" width="600">

