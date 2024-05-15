

; ~/.emacs.d/init.el

;; 基本都来自 https://zhuanlan.zhihu.com/p/385214753







;(setq confirm-kill-emacs #'yes-or-no-p)      ; 在关闭 Emacs 前询问是否确认关闭，防止误触    。。这个应该默认开启的， 因为 我关闭的时候 emacs 需要我 挨个确认。。
;(electric-pair-mode t)                       ; 自动补全括号   。。<> 它不会自动不全， {},() 可以。 因为 < 可以是小于号 
(add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号     。。不清楚，反正 我在 TUTORIAL.cn 中， 可以 高亮 另一个 (大/圆) 括号 。 不太一样， 目前是 在 {, (, 《 上时，可以高亮 另一半,没有匹配的话 闪紫色 。 },),》 不行。  <，> 都不行。   我不知道 编程模式下 会怎么样
;(column-number-mode t)                       ; 在 Mode line 上显示列号   。。就是  下面的  只有一行的 小灰条 中 会有 (行，列) ，不知道默认有没有。 所以 先关闭了，看下默认有没有，没有我再 开启 。 关闭状态下,只有行(L22)，没有列 . 可以用了，暂时不需要开启。  列。应该不太需要吧。
(global-auto-revert-mode t)                  ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(delete-selection-mode t)                    ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）     。。可以，我也觉得挺好的。
;(setq inhibit-startup-message t)             ; 关闭启动 Emacs 时的欢迎界面     。。这个还是开着吧， 如果装上 dashboard，这里 关闭掉， 会显示 dashboard吗？
(setq make-backup-files nil)                 ; 关闭文件自动备份     。。不过我本来就没有看到 带~ 后缀 的文件，不知道是不是默认关闭的。  。。需要手动关闭的， 看到 ~ 了，  但是不知道 #文件名# 是怎么来的。。 #xx# 是自动保存。  默认情况下，Emacs 每 300 秒（5 分钟）自动保存一次缓存。 。 就这样吧。 5分钟 也不频繁。 要是 真掉了数据，估计要爆炸。
(add-hook 'prog-mode-hook #'hs-minor-mode)   ; 编程模式下，可以折叠代码块
(global-display-line-numbers-mode 1)         ; 在 Window 显示行号 。。这个行号是：当前的行数，然后上下2侧 从1开始的哪个？ 有点怪。 但是 TUTORIAL.cn 没有。  应该不是， 2侧从1开始，是下面的 相对行号，那个关了， 是不是 相对行号 把 这里的行号 遮蔽了？  是的，至少 相对行号 可以遮蔽 行号。  我试下 关闭，还会有 行号吗？ 关闭就没了。  可以看 `C-x C-b` 找到 scratch，里面会有行号的。 关闭后，里面没有行号。
;(tool-bar-mode -1)                           ; （熟练后可选）关闭 Tool bar
(when (display-graphic-p) (toggle-scroll-bar -1)) ; 图形界面时关闭滚动条

;(savehist-mode 1)                            ; （可选）打开 Buffer 历史记录保存  。。这个不知道 在哪里看。  可选。。就关了。
;(setq display-line-numbers-type 'relative)   ; （可选）显示相对行号    。。关了，影响 行号的。
(add-to-list 'default-frame-alist '(width . 90))  ; （可选）设定启动图形界面时的初始 Frame 宽度（字符数）       。。 这个要的， 之前 每次 开启 都是  豆腐块大小，还得 手动拉伸。。。
(add-to-list 'default-frame-alist '(height . 65)) ; （可选）设定启动图形界面时的初始 Frame 高度（字符数）       。。。 但是这个值，不太理解， 我修改了 没效果啊。。始终都是 那个大小 (当然 比 豆腐块大很多，可以不拉伸frame大小 就可以用。 )

;(global-set-key (kbd "M-w") 'kill-region)              ; 交换 M-w 和 C-w，M-w 为剪切
;(global-set-key (kbd "C-w") 'kill-ring-save)           ; 交换 M-w 和 C-w，C-w 为复制
;(global-set-key (kbd "C-a") 'back-to-indentation)      ; 交换 C-a 和 M-m，C-a 为到缩进后的行首
;(global-set-key (kbd "M-m") 'move-beginning-of-line)   ; 交换 C-a 和 M-m，M-m 为到真正的行首  。。我暂时不需要 切换。
(global-set-key (kbd "C-c '") 'comment-or-uncomment-region) ; 为选中的代码加注释/去注释   。。这个挺奇怪的。 百度了下，默认是 m-; 但是这个功能 只能 在 后面 开启注释，不能注释 整行，所以 开启试下。


;; 自定义两个函数
;; Faster move cursor
(defun next-ten-lines()
  "Move cursor to next 10 lines."
  (interactive)
  (next-line 10))

(defun previous-ten-lines()
  "Move cursor to previous 10 lines."
  (interactive)
  (previous-line 10))
;; 绑定到快捷键
(global-set-key (kbd "M-n") 'next-ten-lines)            ; 光标向下移动 10 行
(global-set-key (kbd "M-p") 'previous-ten-lines)        ; 光标向上移动 10 行        。。可能用的到吧。


(pixel-scroll-precision-mode t)

(global-set-key (kbd "M-/") 'hippie-expand)   ;; 不太清楚功能
















;;;; 上面内置的，下面 加载第三方包





;(require 'package)     ; 。。这行必须吗？ 我看清华的只有下面3行，先关闭试下。 估计要的。 不需要，直接 `M-x package-install` ，可以看到 一些 连接的日志，反正 看到了 清华的 网址。  估计默认加载这个package了。

;;;;;; https://mirrors.tuna.tsinghua.edu.cn/help/elpa/
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) ;; You might already have this line

; 插件会被安装到 ~/.emacs.d/elpa/ 目录下 , 确实， 我 看了下，有这个 elpa, 并且是 刚刚建立的， 估计就是 上面 package-install 所以 创建了这个目录，  我没有安装插件， C-g 退出了。


; 我是 29.3 已经自带 use-package 了。






;;;;  package-install 不能迁移，所以 使用配置的方式， 但是 我看其他人的配置，里面 没有 use-package， 我找不到 他们是如何声明 插件的。  难道 init-xxx.el 会自动下载？  



(use-package ivy
  :ensure t)



(use-package counsel
  :ensure t)


(use-package amx
  :ensure t
  :init (amx-mode))

(use-package ace-window
  :ensure t
  :bind (("C-x o" . 'ace-window)))


(use-package mwim
  :ensure t)
(global-set-key (kbd "C-a") 'mwim-beginning)
(global-set-key (kbd "C-e") 'mwim-end)


(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode)
  :custom
  (undo-tree-auto-save-history nil))



(use-package which-key
  :ensure t
  :init (which-key-mode))   ; 6



(use-package avy
  :ensure t
  :bind
  (("C-'" . avy-goto-char-timer)))  ; 感觉有 swiper 的情况下， 这个 意义不太大。



;;; Enable rich annotations using the Marginalia package
;(use-package marginalia
;  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
;  ;; available in the *Completions* buffer, add it to the
;  ;; `completion-list-mode-map'.
;  :bind (:map minibuffer-local-map
;         ("M-A" . marginalia-cycle))
;
;  ;; The :init section is always executed.
;  :init
;
;  ;; Marginalia must be activated in the :init section of use-package such that
;  ;; the mode gets enabled right away. Note that this forces loading the
;  ;; package.
;  (marginalia-mode))           ; 启动会报错： Symbol’s function definition is void: marginalia-mode




; hydra 暂时不太需要。  将 命令 组合在一起。




(use-package multiple-cursors
  :ensure t
  :bind
  ("C-S-<mouse-1>" . mc/toggle-cursor-on-click))
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)



;; use-package with package.el:
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
; 可以自定义 展示多少个 recent, bookmark,project, agenda, registers， 看 github




;(use-package highlight-symbol        ; 需要 package cl,  不装了。
;  :ensure t
;  :init (highlight-symbol-mode)
;  :bind ("<f3>" . highlight-symbol)) ;; 按下 F3 键就可高亮当前符号



(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))




(use-package flycheck
  :ensure t
  :config
  (setq truncate-lines nil) ; 如果单行信息很长会自动换行
  :hook
  (prog-mode . flycheck-mode))

; https://www.flycheck.org/en/latest/languages.html#syntax-checker-c-c-gcc   具体语言没有配置，不知道怎么配。。




; https://emacs-lsp.github.io/lsp-mode/
; 不理解。



; https://emacs-lsp.github.io/dap-mode/
; https://emacs-lsp.github.io/dap-mode/page/configuration/  
; 没有 cpp 啊。



(use-package projectile
  :ensure t
  :bind (("C-c p" . projectile-command-map))
  :config
  (setq projectile-mode-line "Projectile")
  (setq projectile-track-known-projects-automatically nil))

(use-package counsel-projectile
  :ensure t
  :after (projectile)
  :init (counsel-projectile-mode))





; ((c++-mode . ((flycheck-clang-language-standard . "c++11"))))



; C-x g
(use-package magit
  :ensure t)




(use-package c++-mode
  :functions 			; suppress warnings
  c-toggle-hungry-state
  :hook
  (c-mode . lsp-deferred)
  (c++-mode . lsp-deferred)
  ;(c++-mode . c-toggle-hungry-state)
  )







; 可以了 ; package-list-packages   会更新包信息。

; 版本不对， 服务器上是 20240 5 15 ， 不是 0 4 15 ， 不知道 启动时的 0415 哪里来的， 可能要过段时间 就会好吧。
;Failed to install rust-mode: http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/rust-mode-20240415.936.tar: Not found

(use-package rust-mode
  :ensure t
  :functions dap-register-debug-template
  :bind
  ("C-c C-c" . rust-run)
  :hook
  (rust-mode . lsp-deferred)
  :config
  ;; debug
;  (require 'dap-gdb-lldb)    ;; 没有装 dap-lldb，所以不能用，  调试的。
;  (dap-register-debug-template "Rust::LLDB Run Configuration"
;                               (list :type "lldb"
;				     :request "launch"
;			             :name "rust-lldb::Run"
;				     :gdbpath "rust-lldb"
;				     :target nil
;				     :cwd nil))
             )

(use-package cargo
  :ensure t
  :hook
  (rust-mode . cargo-minor-mode))






; 切换工作区，还得仔细看看
(use-package treemacs
  :ensure t
  :defer t
  :config
  (treemacs-tag-follow-mode)
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ;; ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag))
  (:map treemacs-mode-map
	("/" . treemacs-advanced-helpful-hydra)))

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile))

(use-package lsp-treemacs
  :ensure t
  :after (treemacs lsp))





;;;;;;;;;;;;;;;;;;;;


(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 2) ; 只需敲 1 个字母就开始进行自动补全
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.2)
  (setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence))) ; 根据选择的频率进行排序，读者如果不喜欢可以去掉



; 使用图形界面，可以再安装一个 company-box 用以显示图标：
;(use-package company-box
;  :ensure t
;  :if window-system
;  :hook (company-mode . company-box-mode))



; 这个 for while 模板的 右大括号的 位置有问题。 需要 自己修正的。。
;   看了下， 模板没有问题， 应该是 被 emacs 的 某个特性 影响了，导致 } 后移了。  应该是： 在没有完成 一句 语句 ( 就是没有 分号 )的情况下， 回车 会 自动 再次缩进 一个tab，   模板应该收到了这个 特性的影响。 但我不知道是什么，怎么改。
;   还行， 写完后 光标移动到 } 所在行后， tab 一下， 就可以 自动 回到 应该的位置。  即使你自己在前面 加几个 空格， 然后 tab 也可以 自动归位，  光标 在 } 上 或前面， tab 都可以，  在 }之后 ，tab 无效
; 代码模板
(use-package yasnippet
  :ensure t
  :hook
  (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all)
  ;; add company-yasnippet to company-backends
  (defun company-mode/backend-with-yas (backend)
    (if (and (listp backend) (member 'company-yasnippet backend))
	backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  ;; unbind <TAB> completion
  (define-key yas-minor-mode-map [(tab)]        nil)
  (define-key yas-minor-mode-map (kbd "TAB")    nil)
  (define-key yas-minor-mode-map (kbd "<tab>")  nil)
  :bind
  (:map yas-minor-mode-map ("S-<tab>" . yas-expand)))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)





(use-package all-the-icons
  :ensure t     ;; 网上没有这行，  导致 启动时： Cannot load all-the-icons  。。。
  :if (display-graphic-p))




(use-package monokai-theme
  :ensure t
  :config   ;; 不加这行， Failed to parse package monokai-theme: use-package: :ensure wants exactly one argument  应该是 把下面的 也当作 ensure 的参数。
  (load-theme 'monokai t))






; mode-line .




; org-roam

; org-mode



; https://github.com/dholm/benchmark-init-el
; 获得 启动时 的 各个包的 消耗的时间。







;;; 下面是 package-install ivy 自动添加的

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(ace-window amx swiper-helm counsel ivy))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; 下面是 github 上 的 small config example, 网上也有，所以自己复制进来了。

(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)       ;;; 修改了 M-x 。。 要安装 counsel  还得注释掉。。
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;;; 上面的复制后， emacs 的 M-c 不能用了。 有 counsel， 那就 安装下 counsel
;;  但是 不能 M-c 怎么安装 counsel ...   
;; 安装 counsel 没有 修改 这个文件。


;; 顺便把 swiper 也装了， 虽然不知道有什么用。
;; 这个。。装的是 swiper-helm ..  和 swiper 有什么区别吗？ 这个应该是 helm 版的， 就是 没有找到 swiper，它帮我装了个 swiper-helm 。。  在 git 上 说到了 swiper-helm，它是  基于helm的
;; swiper-helm 没有 修改 本文件。
;; 搞不懂， 清华的仓库里有 swiper 啊。 0.14.2    
;; package-delete 的时候， 显示，我已经有 swiper 和 swiper-helm 了，  估计是装 counsel 的时候 一并装了 ？ 

; drwxr-xr-x. 1 asdf asdf  142  5月15日 15:24 swiper-helm-20180131.1744
; drwxr-xr-x. 1 asdf asdf 2292  5月15日 15:24 helm-20240513.1346
; drwxr-xr-x. 1 asdf asdf  308  5月15日 15:24 helm-core-20240510.1815
; drwxr-xr-x. 1 asdf asdf  292  5月15日 15:24 async-20240323.1912
; drwxr-xr-x. 1 asdf asdf  110  5月15日 15:24 wfnames-20240418.1005
; drwxr-xr-x. 1 asdf asdf   94  5月15日 15:24 popup-20240101.830
; drwxr-xr-x. 1 asdf asdf  110  5月15日 15:22 counsel-20240502.743
; drwxr-xr-x. 1 asdf asdf  102  5月15日 15:22 swiper-20240405.1642
; drwxr-xr-x. 1 asdf asdf  296  5月15日 15:12 ivy-20240502.808
; drwxr-xr-x. 1 asdf asdf   28  5月15日 14:12 archives
; drwx------. 1 asdf asdf  102  5月15日 14:12 gnupg

;; 确实， 装 counsel 的时候 一起装的 swiper， 但是 为什么 package-install 中 没有 swiper 呢？
; 我现在 输入 swiper 只有2个：  swiper-helm,  org-starter-swiper    不可能后者是 swiper 吧？
;; 而且 这逻辑 是真的坑， 我要 swiper， 结果装了一个 swiper-helm 。。 wtf？
;; ..? 越来越怪了， 刚才 package-delete 还可以看到 swiper-helm， 重启后 没了。。
; 我之前 package-delete 的时候 看到了 swiper-helm 和 swiper， 但是 没有 回车 啊。 rm 算了。

; drwxr-xr-x. 1 asdf asdf 2292  5月15日 15:24 helm-20240513.1346
; drwxr-xr-x. 1 asdf asdf  308  5月15日 15:24 helm-core-20240510.1815
; drwxr-xr-x. 1 asdf asdf  292  5月15日 15:24 async-20240323.1912
; drwxr-xr-x. 1 asdf asdf  110  5月15日 15:24 wfnames-20240418.1005
; drwxr-xr-x. 1 asdf asdf   94  5月15日 15:24 popup-20240101.830
; drwxr-xr-x. 1 asdf asdf  110  5月15日 15:22 counsel-20240502.743
; drwxr-xr-x. 1 asdf asdf  102  5月15日 15:22 swiper-20240405.1642
; drwxr-xr-x. 1 asdf asdf  296  5月15日 15:12 ivy-20240502.808
; drwxr-xr-x. 1 asdf asdf   28  5月15日 14:12 archives
; drwx------. 1 asdf asdf  102  5月15日 14:12 gnupg



;;;;;; package-install 装了 amx
;; 网上有几行配置，但是 我看 github 上没有， 所以也没有写。
;; 我的安装方式 错了。。 直接 package-install  的话，  不会在 本文件 留下 信息， 所以 其他人 用不了， 不知道你装了 什么。。。


;;;;;;; 装了 ace-window


;;;  ⛔ Warning (comp): amx.el:1207:4: Warning: `declare' after `interactive'
;;;  ⛔ Warning (comp): amx.el:1260:9: Warning: Variable ‘commands’ left uninitialized
;;;  ⛔ Warning (comp): avy.el:1725:14: Warning: ‘inhibit-point-motion-hooks’ is an obsolete variable (as of 25.1); use ‘cursor-intangible-mode’ or ‘cursor-sensor-mode’ instead
;;;  ⛔ Warning (comp): ace-window.el:95:2: Warning: custom-declare-variable `aw-minibuffer-flag' docstring wider than 80 characters
;;;  ⛔ Warning (comp): ace-window.el:99:2: Warning: custom-declare-variable `aw-ignored-buffers' docstring wider than 80 characters
;;;  ⛔ Warning (comp): ace-window.el:104:2: Warning: custom-declare-variable `aw-ignore-on' docstring wider than 80 characters
;;;  ⛔ Warning (comp): ace-window.el:117:12: Warning: defcustom for ‘aw-leading-char-style’ has syntactically odd type ‘'(choice (const :tag single char 'char) (const :tag full path 'path))’
;;;  ⛔ Warning (comp): ace-window.el:138:2: Warning: custom-declare-variable `aw-frame-offset' docstring wider than 80 characters
;;;  ⛔ Warning (comp): ace-window.el:143:2: Warning: custom-declare-variable `aw-frame-size' docstring wider than 80 characters
;;;  ⛔ Warning (comp): ace-window.el:149:12: Warning: defcustom for ‘aw-char-position’ has syntactically odd type ‘'(choice (const :tag top left corner only 'top-left) (const :tag both left corners 'left))’
;;;  ⛔ Warning (comp): ace-window.el:157:2: Warning: defvar `aw-dispatch-alist' docstring wider than 80 characters
;;;  ⛔ Warning (comp): ace-window.el:191:2: Warning: custom-declare-variable `aw-make-frame-char' docstring wider than 80 characters
;;;  ⛔ Warning (comp): ace-window.el:449:2: Warning: docstring wider than 80 characters
;;;  ⛔ Warning (comp): ace-window.el:539:37: Warning: Case 'visible will match ‘quote’.  If that’s intended, write (visible quote) instead.  Otherwise, don’t quote ‘visible’.
;;;  ⛔ Warning (comp): ace-window.el:539:37: Warning: Case 'global will match ‘quote’.  If that’s intended, write (global quote) instead.  Otherwise, don’t quote ‘global’.
;;;  ⛔ Warning (comp): ace-window.el:539:37: Warning: Case 'frame will match ‘quote’.  If that’s intended, write (frame quote) instead.  Otherwise, don’t quote ‘frame’.

;; 不知道这些 警告 要不要紧。。。 现在已经是 靠配置了， 不是 靠 package-install 了



(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . 'swiper)
   ("C-x b" . 'ivy-switch-buffer)
   ("C-c v" . 'ivy-push-view)
   ("C-c s" . 'ivy-switch-view)
   ("C-c V" . 'ivy-pop-view)
   ("C-x C-@" . 'counsel-mark-ring); 在某些终端上 C-x C-SPC 会被映射为 C-x C-@，比如在 macOS 上，所以要手动设置
   ("C-x C-SPC" . 'counsel-mark-ring)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))








; rust 默认(或者受到 setq-default 的影响)  4个空格，不需要改。 

(add-hook 'c++-mode-hook 'my-c++-mode-hook)   ;; 能用。不然 cpp 一个tab 2个空格 ， 之前 把 tab 改成4个空格长度， rust 就是 一个tab，长度是4个空格， 但是 cpp是 一个tab 用2个空格代替了。 感觉要设置成全局的？
(defun my-c++-mode-hook ()
  (interactive)
  ;; 设置缩进为 4 个空格
  (setq c-basic-offset 4)
  ;; 设置 tab 键的缩进大小
  (setq indent-tabs-mode nil)
)


; ;; 设置缩进为 4 个空格        ; 不行
; (setq c-basic-offset 4)
; ;; 设置 tab 键的缩进大小
; (setq indent-tabs-mode nil)


(setq-default indent-tabs-mode nil)     ; 可以，不进mode 的话，可以。 进入C++ mode，必须 上面的 add-hook，不然 c++ 还是 一个 tab 2个空格。
(setq-default tab-width 4)
;(setq indent-line-function 'insert-tab)



(provide 'init)     ; 。。说要有这个。。但是我之前没有 也可以啊。。
;;; init.el ends here
