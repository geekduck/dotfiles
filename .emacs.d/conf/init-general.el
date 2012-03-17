; 一般的な設定

; 行番号を表示
(global-linum-mode t)

; 文字エンコーディング
;; Mac だけに読み込ませる
(when (eq system-type 'darwin)
    ;; Mac でファイル名を正しく扱う
    (require 'ucs-normalize)
    (setq file-name-coding-system 'utf-8-hfs)
    (setq locale-coding-system 'utf-8-hfs))
