(module auto-conjure {require {{:decode decode} edn} autoload {a aniseed.core}})

(local nvim vim.api)

(fn get-project-root []
  (vim.fn.getcwd))

(fn shadow-cljs []
  (let [project-root (get-project-root)
        shadow-path (.. project-root :/shadow-cljs.edn)
        file (io.open shadow-path :r)]
    (if file
        (let [content (file:read :*a)]
          (file:close)
          content)
        (do
          (nvim.nvim_err_writeln (.. "File not found: " shadow-path))
          nil))))

(fn build-key [tbl]
  (let [lseq []]
    (each [k v (pairs tbl.builds)]
      (table.insert lseq k))
    (a.first lseq)))

(fn shadow-build-id []
  (build-key (decode (shadow-cljs))))

(fn auto-conjure-select []
  (let [cmd (.. "ConjureShadowSelect " (shadow-build-id))]
    ;(a.println cmd)
    (nvim.nvim_command cmd)))

(nvim.nvim_create_user_command :AutoConjureSelect auto-conjure-select {})

{: shadow-build-id : auto-conjure-select}
