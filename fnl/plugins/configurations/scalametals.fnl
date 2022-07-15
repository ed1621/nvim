(require-macros :hibiscus.vim)

(rem! shortmess "F") 
(set+ shortmess "c")

(local metals (require :metals))

; (lambda on_attach [client bufnr] 
;   (let [dap (require :dap)]
;     (dap.configurations.scala [{:type :scala
;                                :request :launch
;                                :name :RunOrTest
;                                :metals {:runType :runOrTestFile}}
;                               {:type :scala
;                                :request :launch
;                                :name :Run
;                                :metals {:runType :run}}
;                               {:type :scala
;                                :request :launch
;                                :name "Test Target"
;                                :metals {:runType :testTarget}}])
;     (metals.setup_dap)))

(let [config (metals.bare_config)
      capabilities (vim.lsp.protocol.make_client_capabilities)]
  (tset config.settings :showInferredType true)
  (tset config.settings :showImplicitConversionsAndClasses true)
  (tset config.settings :excludedPackages [ 
         :akka.actor.typed.javadsl 
         :com.github.swagger.akka.javadsl
         :akka.stream.javadsl
         :akka.http.javadsl
         :com.google
         :com.ibm
         :coursierapi
         :javax
         :org.apache.ivy
         :org.apache.hadoop.util
         :org.apache.hadoop.yarn
         :org.w3c
         :org.xbill
         :scala.xml
         :org.glassfish
         :com.ctc
         :com.github.javaparser
         :java.lang.annotation
         :org.codehaus
         :io.netty
         :org.antlr
         :javassist
         :org.apache.commons.math3
         :org.apache.http
         :org.apache.parquet])
  (tset config.init_options :statusBarProvider :on)
  (tset capabilities.textDocument.completion.completionItem :snippetSupport true)
  ; (tset config :capabilities (require :cmp_nvim_lsp.update_capabilities capabilities))
  ; (tset config on_attach on_attach)
  (augroup! :lsp
    [[FileType] [scala sbt java] #(metals.initialize_or_attach config)])
  )
