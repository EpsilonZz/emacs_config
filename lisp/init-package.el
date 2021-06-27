;;; init-package.el --- 关于包管理的部分
;;; Commentary:
;;; Code:

(use-package restart-emacs)

;; 这个包用来测试启动耗时
;; M-x benchmark-init/show-durations-tree
;; or
;; M-x benchmark-init/show-durations-tabulated
(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

;; 这个包用来添加快捷键
(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line);; 在非空字符和行头之间横跳
	 ("C-c ^" . crux-top-join-line)
	 ("C-x ," . crux-find-user-init-file);; 快速打开init.el配置文件
	 ("C-S-d" . crux-duplicate-current-line-or-region);; 复制一行或者一个区域
	 ("C-S-k" . crux-smart-kill-line)))

;; 删除快捷键
;; 删除直到第一个非空字符
(use-package hungry-delete
    :bind (("C-c DEL" . hungry-delete-backward)
           ("C-c d" . hungry-delete-forward)))

;; 行/区域上下移动
;; 移动的时候不改变其他的文本
(use-package drag-stuff
  :bind (("<M-up>". drag-stuff-up)
         ("<M-down>" . drag-stuff-down)))

;; emacs 三剑客 ivy counsel swiper
;; ivy 提供引擎支持
(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-initial-inputs-alist nil
        ivy-count-format "%d/%d "
        enable-recursive-minibuffers t
        ivy-re-builders-alist '((t . ivy--regex-ignore-order)))

;; 
(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c f" . counsel-recentf)
         ("C-c g" . counsel-git))))


;; 
(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
                swiper-include-line-number-in-search t))

;; 自动补全 company
(use-package company
  :config
  (setq company-dabbrev-code-everywhere t
        company-dabbrev-code-modes t
        company-dabbrev-code-other-buffers 'all
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case t
        company-dabbrev-other-buffers 'all
        company-require-match nil
        company-minimum-prefix-length 2
        company-show-numbers t
        company-tooltip-limit 20
        company-idle-delay 0
        company-echo-delay 0
        company-tooltip-offset-display 'scrollbar
        company-begin-commands '(self-insert-command))
  (push '(company-semantic :with company-yasnippet) company-backends)
  :hook ((after-init . global-company-mode)))

;; 使用fly-check对编程语言进行检查
;; 可以选择在全局或者在相应的编程模式下进行
(use-package flycheck
  :hook (after-init . global-flycheck-mode))
;; hook (prog-mode . flycheck-mode))

;; 管理分屏
(use-package ace-window
  :bind (("M-o" . 'ace-window)))

(provide 'init-package)
;;; init-package.el ends here
