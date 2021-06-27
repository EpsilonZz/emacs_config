;;; init-ui.el --- 有关ui界面的设置
;;; Commentary:
;;; Code:

;; 主题 gruvbox的软暗色
(use-package gruvbox-theme
  :init (load-theme 'gruvbox-dark-soft t))

;; modo line设置
(use-package smart-mode-line
    :init
    (setq sml/no-confirm-load-theme t)
    (setq sml/theme 'respectful) ;; 根据当前的主题来设置自己主题的样子
    (sml/setup))

;; 需要先加载主题， 再加载sml

;; 下面的代码在windows下修改显示字体
(use-package emacs
  :if (display-graphic-p);; 只在图形化界面的时候生效
  :config
  ;; Font settings
  (if *is-windows*
    (progn ;; progn 将多条语句包裹起来
      (set-face-attribute 'default nil :font "Consolas")
      (dolist (charset '(kana han symbol cjk-misc bopomofo));; 修改中文字体
        (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "Microsoft Yahei UI" :size 12))))
    (set-face-attribute 'default nil :font "Source Code Pro for Powerline 11")))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(provide 'init-ui)
;;; init-ui.el ends here
