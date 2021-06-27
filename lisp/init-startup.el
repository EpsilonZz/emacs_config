;;; init-startup.el --- 有关启动的设置
;;; Commentary:
;;; Code:

;; 设置编码
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; 设置垃圾回收的阈值，以最大的方式回收
(setq gc-cons-threshold most-positive-fixnum)

;;关闭菜单栏
;;(menu-bar-mode -1)
;;关闭工具栏
;;(tool-bar-mode -1)
;;关闭滚动条
;;(scroll-bar-mode -1)

;;关闭启动界面
(setq inhibit-startup-screen t)
;;关闭自动备份
(setq make-backup-files nil)

(provide 'init-startup)
;;; init-startup.el ends here
