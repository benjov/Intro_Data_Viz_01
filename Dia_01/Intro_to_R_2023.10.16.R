# ****************************************************************************

# 08 / 10 / 2023
# Autor: Benjamín Oliva (benjamin.oliva@expo.puntoempresarios.club)

# ****************************************************************************

# Comenzando con R: Comience descargando R y RStudio IDE, busca la versión más 
# adecuada para ti https://posit.co/download/rstudio-desktop/

# ****************************************************************************

# Instalando paquetes

# La forma más sencilla de instalar ggplot2 es instalando la paquetería completa 
# de tidyverse:
install.packages("tidyverse")

# Alternativamente pueden sólo instalar ggplot2:
install.packages("ggplot2")
#library(ggplot2)

# Instalemos ‘quantmod’
# "Quantitative Financial Modelling and Trading Framework for R"
# El paquete quantmod para R está diseñado para ayudar a los prefesionistas 
# financieros en el desarrollo, prueba, y el despliegue de modelos estadísticos.

install.packages("quantmod")

# Usando paqueterías:

library(quantmod)

# Usando ggplot2 y quantmod

?getSymbols

getSymbols("AAPL") # Apple Inc, NASDAQ: AAPL

getSymbols("AAPL", src = "yahoo", from = "2010-01-01", to = "2023-10-10", periodicity = "daily")

# Imprimamos el precio de cierre
AAPL$AAPL.Close

# Gráfico básico en 'quantmod'
chartSeries(AAPL)

# Gráfico interactivo
install.packages("highcharter")

library(highcharter)

hchart(AAPL)

# Usemos datos de la Federal Reserve Economic Data (FRED)--https://fred.stlouisfed.org/
# https://fred.stlouisfed.org/series/GDP

getSymbols("GDP", src = "FRED")

# Usemos el gráfico más popular en R:

library(ggplot2)

GDP_DF <- as.data.frame( GDP ) # Convertimos a Data Frame
GDP_DF$Date <- as.Date( rownames(GDP_DF) ) 
               # Convertir nombre de filas a valores en una columna del tipo fecha

g1 <- ggplot( data = GDP_DF , aes( x = GDP_DF$Date, y = GDP_DF$GDP ) ) 
      # Define el gráfico como un objeto de gplot
g1 <- g1 + geom_line ( color = "darkblue", size = 1.5 ) # Define el objeto geométrico
g1 <- g1 + labs( title = "Gross Domestic Product", subtitle = "Frequency: Quarterly") 
      # Títulos y subtítulos
g1 <- g1 + xlab("Fecha") + ylab("Billions of Dollars") # Títulos de ejes
g1 <- g1 + theme_bw() # Tema con fondo blanco
g1 # Imprime la gráfica

# *****************************************************************************
# Guardamos 
getwd() # ¿Cuál es la dirección de trabajo?

setwd("/Users/benjamin/Library/Mobile Documents/com~apple~CloudDocs/Documents/Personal/PuntoEmpresarios/Propuestas/Taller 1 Data Viz")
# Cambiar la siguiente ruta dependiendo de la ubicación en sus equipos

getwd()

#
install.packages("writexl")

library(writexl)

# Escribir el DataFrame en un archivo de Excel
write_xlsx(GDP_DF, path = "GDP_Data.xlsx") 

# Leer datos
install.packages("readxl")

library(readxl)

Datos <- read_excel("GDP_Data.xlsx", sheet = "Sheet1", col_names = TRUE)

head(Datos)

tail(Datos)

# FIN