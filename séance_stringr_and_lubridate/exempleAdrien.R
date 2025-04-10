library(stringr)

# Supprime la n-ième occurrence de 'motif' dans chaque string
textes = c("a a a a", "b b b", "c c")
textes %>% str_replace(paste0("^((.*?a){1}.*?)a"), "\\1")
