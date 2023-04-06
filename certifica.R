# Pacotes Necessários
pacman::p_load(readr, here)
rm(list=ls())

# Carrega lista de inscritos
inscritos <- read.csv2(here("autores.csv"))
i <- 1

for(i in 1:nrow(inscritos)) {
  # Certificados
  # O corpo do certificado e o modelo devem ser alterados no arquivo Certificado.Rmd
  rmarkdown::render('certificado.Rmd', output_file = paste0('certificados/',gsub(' ','_',inscritos[i,'Autores']),'.pdf'),
                   envir = new.env(parent = globalenv()))
}
