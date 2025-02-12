#!/bin/bash
ORG_NAME=co.gaiwan
PRJ_NAME=litetodo

neil new app ${ORG_NAME}/${PRJ_NAME}
cd ${PRJ_NAME}
neil dep add org.clojure/clojure 1.12.0

# Routing
neil dep add ring/ring-jetty-adapter
neil dep add metosin/reitit
neil dep add metosin/ring-http-response
neil dep add ring/ring-defaults

# Reload 
neil dep add aero/aero
neil dep add integrant/integrant

# Dev
neil dep add integrant/repl

# Frontend
neil dep add com.lambdaisland/hiccup 
neil dep add com.lambdaisland/ornament   

# Util
neil dep add hato/hato
neil dep add lambdaisland/uri                      
neil dep add cheshire/cheshire
neil dep add clojure.java-time/clojure.java-time
neil dep add java-time-literals/java-time-literals 

# Logging
neil dep add io.pedestal/pedestal.log 
neil dep add ch.qos.logback/logback-classic

