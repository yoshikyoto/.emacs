;;; Commentary: phpコーディング規約
(add-hook 'php-mode-hook
          '(lambda()
             (setq indent-tabs-mode t) ;インデントはタブ
             (setq c-basic-offset 4) ;タブ幅を4に設定
             (c-set-offset 'case-label '+))) ;switch-caseでインデントする
