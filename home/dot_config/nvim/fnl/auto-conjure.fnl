(local {: autoload} (require :nfnl.module))
(local a (autoload :nfnl.core))
(local {: decode} (autoload :edn))

(fn shadow-cljs-content []
  (a.slurp :shadow-cljs.edn))

(fn build-key [tbl]
  (a.first (a.keys (a.get tbl :builds))))

(fn shadow_build_id []
  (build-key (decode (shadow-cljs-content))))

{: shadow_build_id}
