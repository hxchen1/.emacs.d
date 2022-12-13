(use-package gruvbox-theme
  :init (load-theme 'gruvbox-dark-soft))

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


(provide 'init-ui)
