(use-package restart-emacs)

(use-package keycast)
(keycast-mode t)
;; 增强补全，包括文件和switch buffer的补全
(use-package vertico)
(vertico-mode t)

;; 可以颠倒顺序的搜索文件
(use-package orderless)
(setq completion-styles '(orderless))

;; 显示很多内容，在buffer后面
(use-package marginalia)
(marginalia-mode t)

;; 弹出一个窗口告诉你想要干什么
(use-package embark)
(global-set-key (kbd "C-;") 'embark-act)

(setq prefix-help-command 'embark-prefix-help-command)

(use-package consult)
;; 替代swiper的功能
(global-set-key (kbd "C-s") 'consult-line)

;; 查找函数
(global-set-key (kbd "M-s i") 'consult-imenu)


(use-package evil)
(evil-mode 1)

(use-package embark-consult)
(use-package wgrep)
(eval-after-load
    'consult
  '(eval-after-load
       'embark
     '(progn
	(require 'embark-consult)
	(add-hook
	 'embark-collect-mode-hook
	 #'consult-preview-at-point-mode))))

(define-key minibuffer-local-map (kbd "C-c C-e") 'embark-export-write)

(defun embark-export-write ()
  "Export the current vertico results to a writable buffer if possible.
Supports exporting consult-grep to wgrep, file to wdeired, and consult-location to occur-edit"
  (interactive)
  (require 'embark)
  (require 'wgrep)
  (pcase-let ((`(,type . ,candidates)
               (run-hook-with-args-until-success 'embark-candidate-collectors)))
    (pcase type
      ('consult-grep (let ((embark-after-export-hook #'wgrep-change-to-wgrep-mode))
                       (embark-export)))
      ('file (let ((embark-after-export-hook #'wdired-change-to-wdired-mode))
               (embark-export)))
      ('consult-location (let ((embark-after-export-hook #'occur-edit-mode))
                           (embark-export)))
      (x (user-error "embark category %S doesn't support writable export" x)))))

(use-package pyim)

(defun eh-orderless-regexp (orig_func component)
    (let ((result (funcall orig_func component)))
      (pyim-cregexp-build result)))


  (defun toggle-chinese-search ()
    (interactive)
    (if (not (advice-member-p #'eh-orderless-regexp 'orderless-regexp))
	(advice-add 'orderless-regexp :around #'eh-orderless-regexp)
      (advice-remove 'orderless-regexp #'eh-orderless-regexp)))

  (defun disable-py-search (&optional args)
    (if (advice-member-p #'eh-orderless-regexp 'orderless-regexp)
	(advice-remove 'orderless-regexp #'eh-orderless-regexp)))

  ;; (advice-add 'exit-minibuffer :after #'disable-py-search)
  (add-hook 'minibuffer-exit-hook 'disable-py-search)

  (global-set-key (kbd "s-p") 'toggle-chinese-search)

(provide 'init-package)
