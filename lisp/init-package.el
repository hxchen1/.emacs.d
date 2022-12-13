(use-package restart-emacs)

(package-install 'keycast)
(keycast-mode t)
;; 增强补全，包括文件和switch buffer的补全
(package-install 'vertico)
(vertico-mode t)

;; 可以颠倒顺序的搜索文件
(package-install 'orderless)
(setq completion-styles '(orderless))

;; 显示很多内容，在buffer后面
(package-install 'marginalia)
(marginalia-mode t)

;; 弹出一个窗口告诉你想要干什么
(package-install 'embark)
(global-set-key (kbd "C-;") 'embark-act)

(setq prefix-help-command 'embark-prefix-help-command)

(package-install 'consult)
;; 替代swiper的功能
(global-set-key (kbd "C-s") 'consult-line)

;; 查找函数
(global-set-key (kbd "M-s i") 'consult-imenu)


(package-install 'evil)
(evil-mode 1)

(provide 'init-package)
