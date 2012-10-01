;; elisp 拡張機能の読み込み

;; http://www.emacswiki.org/emacs/download/redo+.el
;; redo+の設定
(when (require 'redo+ nil t)
  ;; C-' にredoを割当
  (global-set-key (kbd "C-'") 'redo)
  (setq undo-no-redo t)
  (setq undo-limit 60000)
  (setq undo-strong-limit 90000)
  )

;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.\\(js\\|json\\)$" . js2-mode))

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete/dict/")
(ac-config-default)

