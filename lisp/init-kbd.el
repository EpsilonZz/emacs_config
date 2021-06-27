;;; init-kbd.el --- 有关按键的设置
;;; Commentary:
;;; Code:
;; 更改mac上的映射键
(when *is-mac*
      (setq mac-command-modifier 'meta)
      (setq mac-option-modifier 'none))



(provide 'init-kbd)
;;; init-kbd.el ends here
