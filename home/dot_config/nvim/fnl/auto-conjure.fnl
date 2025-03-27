(module auto-conjure
        {;;
         autoload {a aniseed.core {:decode decode} edn}})

(def- nvim vim.api)

(defn- shadow-cljs-content []
  (a.slurp :shadow-cljs.edn))

(defn- build-key
  [tbl]
  (a.first (a.keys (a.get tbl :builds))))

(defn- shadow-build-id
  []
  (build-key (decode (shadow-cljs-content))))

(defn auto-conjure-select
  []
  (let [cmd (.. "ConjureShadowSelect " (shadow-build-id))]
    (nvim.nvim_command cmd)))

(nvim.nvim_create_user_command :AutoConjureSelect auto-conjure-select {})
