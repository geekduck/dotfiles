;; 一般的な設定

;; utf-8
(set-language-environment 'utf-8)

;; C-h をバックスペースに
(keyboard-translate ?\C-h ?\C-?)

;; 折り返しトグルコマンド
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;; C-t でウィンドウを切替える。初期値はtranspose-chars
(define-key global-map (kbd "C-t") 'other-window)

;; 行番号を表示
(global-linum-mode t)

;; ビープ音を消す
(setq visible-bell t)

;; タブ文字
;; デフォルト８文字から４文字に変更
(setq-default tab-width 4)
;; インデントにタブ文字を使用しない
(setq-default indent-tabs-mode nil)


;; 文字エンコーディング
;; Mac だけに読み込ませる
(when (eq system-type 'darwin)
  ;; Mac でファイル名を正しく扱う
  (require 'ucs-normalize)
  (setq file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))
