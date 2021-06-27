;;; init.el --- 最顶层的配置文件
;;; Commentary:
;;; Code:

;; 设置加载的目标目录 ~/.emacs.d/lisp
(add-to-list 'load-path
    (expand-file-name (concat user-emacs-directory "lisp")))

;; 自定义样式文件
(setq custom-file
    (expand-file-name "custom.el" user-emacs-directory))


(require 'init-const)
(require 'init-kbd)
(require 'init-startup)
(require 'init-elpa)
(require 'init-package)
(require 'init-ui)

;; 加载自定义样式文件
(when (file-exists-p custom-file)
  (load-file custom-file))
;;; init.el ends here
