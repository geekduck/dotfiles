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
