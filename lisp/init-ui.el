;(use-package gruvbox-theme
;  :init (load-theme 'gruvbox-dark-soft 1))

(use-package doom-themes)
(load-theme 'doom-one 1)

(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

					; 设置字体
(set-face-attribute 'default nil :font "Fira Code Medium" :height 160);;
(set-fontset-font t '(#x4e00 . #x9fff) "LXGW WenKai");;

(setq mouse-wheel-scroll-amount '(1 ((shift) .1) . nil)
(setq mouse-wheel-progressive-speed nil)

(use-package emcas
  :if(display-graphic-p)
  :config
  :ensure t
  ;; Font Setting
  (if *is-windows*
      (progn
	(set-face-attribute 'default nil :font "Fira Code")
	(dolist (charset '(kan han symbol cjk-misc bopomofo))
	  (set-fontset-font (frame-parameter nil 'font)
			    charset (font-spec :family "霞鹜文楷" :size 12))))
    (set-face-attribute 'default nil :font "Fira Code")))

(set-default-font "-outline-Fira Code Retina-normal-normal-normal-*-19-*-*-*-c-*-iso8859-1")

; 括号匹配
(show-paren-mode t)


; 高亮行号
(global-hl-line-mode 1)


(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (progn
    (setq column-number-mode t)
    ))

;;modeline上显示我的所有的按键和执行的命令
(package-install 'keycast)
(add-to-list 'global-mode-string '("" keycast-mode-line))
(keycast-mode t)

;; 这里的执行顺序非常重要，doom-modeline-mode 的激活时机一定要在设置global-mode-string 之后‘
(use-package doom-modeline
  :ensure t
  :custom-face
(mode-line ((t (:height 0.9))))
(mode-line-inactive ((t (:height 0.9))))
  :init
  (doom-modeline-mode t))

(setq org-log-done t)
(setq org-log-into-drawer t)


(provide 'init-ui)
