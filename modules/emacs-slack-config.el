(use-package slack
             :commands (slack-start)
             :init
             (setq slack-buffer-emojify: t)
             (setq slack-prefer-current-team t)
             :config
             (slack-register-team
              :name "dwango"
              :default t
              :client-id "2268602738.153814721443"
              :client-secret "dce8a53fe80b5bcad59cf81b05d6683e"
              :token 
