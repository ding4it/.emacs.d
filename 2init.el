(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; 去掉工具栏
(tool-bar-mode -1)

;;去掉菜单栏
(menu-bar-mode -1)

(global-set-key [f5] 'speedbar) ;; 启动文件树
;;;maxinum window
(defun my-max-window()
(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
)
(run-with-idle-timer 1 nil 'my-max-window)

;;;;;;end

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


(setq clojure-defun-style-default-indent t)

(global-set-key [(meta k)] (lambda () 
                             (interactive) 
                             (kill-buffer) 
                             (delete-window))) 



(put 'downcase-region 'disabled nil)

(unless (package-installed-p 'cider)
  (package-install 'cider))
(put 'upcase-region 'disabled nil)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(set cider-interactive-eval-result-prefix ";; => ")
(add-hook 'cider-repl-mode-hook 'paredit-mode)

