(import-macros {: map! : g!} :hibiscus.vim)
(g! mapleader " ")

(fn bulk-add-normal-mappings [commands]
  (each [mapping commands (pairs commands)] 
    (map! [n] mapping commands))
)
{:bulk-add-normal-mappings bulk-add-normal-mappings}
