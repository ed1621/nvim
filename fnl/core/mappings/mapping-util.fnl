(import-macros {: map!} :hibiscus.vim)

(fn bulk-add-normal-mappings [commands]
  (each [mapping commands (pairs commands)] 
    (map! [n] mapping commands))
)
{:bulk-add-normal-mappings bulk-add-normal-mappings}
