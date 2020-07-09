{:user {:dependencies [[cljfmt "0.6.4"]
                       [im.chit/vinyasa  "0.2.0"]]
        :plugins [[lein-pprint "1.2.0"]
                  [lein-kibit "0.1.5"]
                  [jonase/eastwood "0.2.5"]
                  [lein-marginalia "0.9.1"]
                  [io.taylorwood/lein-native-image "0.3.0"]
                  [lein-count "1.0.9"]
                  [[cider/cider-nrepl "0.25.2"]]]
        :injections [(require 'vinyasa.inject)
                     (vinyasa.inject/inject 'clojure.core '>
                                            '[[vinyasa.inject inject]
                                              [vinyasa.pull pull]
                                              [clojure.repl doc source]
                                              [clojure.pprint pprint pp]])]}}
