;;; init-elpa.el --- elpa的初始化
;;; Commentary:
;;; Code:

;;(setq package-archives '(
;;    ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;;    ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;    ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

;; 清华的源company无法安装
(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("melpa-stable" . "http://mirrors.ustc.edu.cn/elpa/melpa-stable/")
                         ("org" . "http://mirrors.ustc.edu.cn/elpa/org/")))

;; 对于软件包不校验签名
(setq package-check-signature nil) ;个别时候会出现签名校验失败

(require 'package) ;; 初始化包管理器


(unless (bound-and-true-p package--initialized)
  (package-initialize)) ;; 初始化package

(unless package-archive-contents
    (package-refresh-contents)) ;; 刷新软件源索引

(unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package));;如果没有安装use-package, 那么刷新软件源并且安装

(eval-and-compile
    (setq use-package-always-ensure t) ;不用每个包都手动添加:ensure t关键字
    (setq use-package-always-defer t) ;默认都是延迟加载，不用每个包都手动添加:defer t
    (setq use-package-always-demand nil)
    (setq use-package-expand-minimally t)
    (setq use-package-verbose t))

(require 'use-package)

(provide 'init-elpa)
;;; init-elpa.el ends here
