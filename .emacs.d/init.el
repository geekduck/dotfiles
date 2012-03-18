;; ロードパス
;; ~/.emacs.d/elisp ディレクトリをロードパスに追加する
;; Emacs23以前用
(when (> emacs-major-version 23)
    (defvar user-emacs-directory "~/.emacs.d"))
;; load-path を追加する関数
(defun add-to-load-path (&rest paths)
    (let (path)
        (dolist (path paths paths)
            (let ((default-directory
                    (expand-file-name (concat user-emacs-directory path))))
              (add-to-list 'load-path default-directory)
              (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
                  (normal-top-level-add-subdirs-to-load-path))))))
;; 引数のディレクトリとそのサブディレクトリをload-path に追加
(add-to-load-path "elisp" "conf" "public_repos")

;; 基本設定
(load "init-general")

;; site-lisp

;; auto-install の設定
(when (require 'auto-install nil t)
  ;; インストールディレクトリ
  (setq auto-install-directory "~/.emacs.d/elisp")
  ;; EmacsWikiに登録されているelisp の名前を取得
  (auto-install-update-emacswiki-package-name t)
  ;; プロキシ設定
  ;; (setq url-proxy-services '(("http", "localhost:8339")))
  ;; install-elisp の関数を利用可能に
  (auto-install-compatibility-setup))

;; 拡張機能の読み込み
(load "init-elisp")

;; haskell 用の設定ファイルを読み込み
(load "init-haskell")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
