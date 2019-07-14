(ns xslt.core
(:require [clojure.java.io :as io])
(:import ( javax.xml.transform.dom DOMSource)
(javax.xml.parsers DocumentBuilderFactory DocumentBuilder)
(javax.xml.transform TransformerFactory Transformer)
          (javax.xml.transform.stream StreamSource StreamResult)
          )
)


(defn -main [& args]
  (let [stylesheet (io/file (io/resource "jcr.xslt"))
        datafile (io/file (io/resource "content-klein.xml"))
        factory (DocumentBuilderFactory/newInstance)
        builder (.newDocumentBuilder factory)
        document (.parse builder datafile)
        
        tFactory (TransformerFactory/newInstance)
        stylesource (StreamSource. stylesheet)
        transformer (.newTransformer  tFactory stylesource)
        source (DOMSource. document)
        out (io/output-stream "result.xml")
        result (StreamResult. out) ;;(System/out)
        ]
(.transform transformer source result)))
