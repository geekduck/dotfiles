; ロードパス
(setq load-path (append (list
                         (expand-file-name "~/.emacs.d")
                         )
                        load-path))

; site-lisp

;; wb-line-number-toggle
(require 'wb-line-number)
(wb-line-number-toggle)

;; haskell-mode
(load "haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
