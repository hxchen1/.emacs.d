;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 绑定到f2上
(global-set-key (kbd "<f2>") 'open-init-file)
(global-set-key (kbd "C-h C-f") 'find-function)


;; Company-mode 快捷键
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)



(provide 'init-keyshort)
