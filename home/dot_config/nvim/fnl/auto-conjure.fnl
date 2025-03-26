(module auto-conjure
        {;;
         require {a aniseed.core {:decode decode} edn}})

(local nvim vim.api)

(fn shadow-cljs-content []
  (a.slurp :shadow-cljs.edn))

(fn build-key [tbl]
  (a.first (a.keys (a.get tbl :builds))))

(fn shadow-build-id []
  (build-key (decode (shadow-cljs-content))))

(fn auto-conjure-select []
  (let [cmd (.. "ConjureShadowSelect " (shadow-build-id))]
    (nvim.nvim_command cmd)))

(nvim.nvim_create_user_command :AutoConjureSelect auto-conjure-select {})

{: shadow-build-id : auto-conjure-select}
