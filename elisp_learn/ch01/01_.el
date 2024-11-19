
; Cx Ce

; 单; 表示执行的代码， 双;; 表示输出


;(progn (prin1 'foo) (princ "\n") (prin1 'bar))
;; foo
;; bar


;['a 'd 'w ?Q]
;; ['a 'd 'w 81]

;['a, 'd, 'w, ?Q]
;; ['a (\, 'd) (\, 'w) (\, 81)]


;()
;; nil

;nil
;; nil

;t
;; t


; a  ;;error


;1.12345678901234567890
;; 1.12345678901234567

;21000000000000000
;; same


;?Q
;; 81


;[?\a ?\b ?\z]
;; 7 8 122

                                        ; 挺奇怪的，有时 在 注释中 写入几个字符后，会改变输出。。
                                        ; 而且怎么在注释后 回车会自动 缩进 呢？看了下 是 40个字符。 缩就缩吧，之前是 克制回车。现在算了。不管了。
; 不回车，回车以后，代码和输出 距离有点远


;?\x41
;; 65


;?\101
;; 65  8进制


;?\^I
;; 9   a是1。

;?\^J
; 10

;?\^i
;; 9
;; 等于下面的 ?\C-i . 会输出多个 (#o11, #x9, ?\C-i)

;?\C-i
;; 9





;(A 2 "A")
;; A被认为是 function，找不到，失败

;('a 'b 'c 'd)
;; a 也被认为是 function 。。


;['a 'b, 'c]
;; ['a 'b (\, 'c)]

;("A" "b" "C")
;; A 还是 function



(1 2 3)
;; invalid function 1


(cdr '(1 2 3))
;; (2 3)


'(1 2 3)
;; (1 2 3)


'(1, 2, 3)
;; (1 (\, 2) (\, 3))


car '(1 (2 3))
;; (1 (2 3))


cdr '(a.b c)
;; (a.b c)


(car '(1 (2 3)))
;; 1

(cdr '(a.b c f))
;; (c f)

;; 外面的括号 代表什么？ 为什么不带括号 就是原来的


(car '(a.b))
;; a.b

(cdr (a.b))
;; void function a.b

'(cdr (a.b))
;; (cdr (a.b))

(cdr '(a.b))
;; nil

cdr '(a.b)
;; (a.b)

;; a.b 不是 点对表示吗？ 代表 cons单元， 怎么这里 完全不行啊。

;; 而且 完全没有提到 前面的 ' 啊， 都是 直接 () 的， 但是这里 完全不行。


(cdr '(a . b))
;; error, expression ends prematurely



"is asd
int asd
ff\  asd\
qwdf"
;; qwdf 不会新起一行。  ff 后面会少一个空格



#("foo bar" 0 3 (face bold) 3 4 nil 4 7 (face italic))
;; 原样输出了一遍
;; 描述 了 前3个字符是粗体，最后3个是 斜体。 但是怎么让它输出 转换后的 字符呢？ 哪里可以看到 转换后的效果？


(prin1 #("fzz bar" 0 3 (face bold) 3 4 nil 4 7 (face italic)))
;; 原样输出了 2 遍



; vector
[1 "two" (three)]
;; 原样

[A B C]
;; 原样， 没有说 A 是 function


'(A B C)
;; (A B C)


(A B C)
;; void function A

[123 "asd" (A B C)]
;; 原样，A 没有错

[123 "zzz" '(A B C)]
;; 原样， 有 '



; char table
#^[1 2 3]
;; invalid size char table
;; 没这么简单，这个应该是要通过 方法创建的。 4.10， 40.22.2， 36



(make-bool-vector 3 t)
;; 输出 #&3"^G"  和教程上一样。 有解释： 因为 C-g 的二进制就是 111


(equal #&3"\377" #&3"\007")
;; t, 因为只使用了 后3个bit， 所以相等。




(make-hash-table)
;; #s(hash-table size 65 test eql rehash-size 1.5 rehash-threshold 0.8125 data ())





(symbol-function 'car)
;; #<subr car>

(subrp (symbol-function 'car))
;; t





; byte code fun ?
#[1234]
;; 1234



type-of([1 2 3])
;; invalide function [1 2 3]


type-of(symbol-function 'car)
;; #<subr car>




(current-buffer)
;; #<buffer 01_.el>


(point-marker)
;; #<marker at 2406 in 01_.el>


(selected-window)
;; #<window 3 on 01_.el>

(selected-frame)
;; #<frame 01_.el - GNU Emacs in 192.xxx 0x345345>


(get-device-terminal nil)
;; #<terminal 1 on wayland-1>


(process-list)
;; #<process server>

(all-threads)
;; (#<thread 0x123123>)


(make-mutex "my-mutex")
;; #<mutex my-mutex>

(make-mutex)
;; #<mutex 0x123123>



(make-condition-variable (make-mutex))
;; #<condvar 0x123123>



'(#1=(a) b #1#)
;; ((a) b (a))  前面没有 ' 了。
;; 代码中不带 ' 就是 invalid function


(proq1 nil
       (setq x '(#1=(a) b #1#)))
(eq (nth 0 x) (nth 2 x))
;; void variable x


;#1=(a #1#)
;; 很猛，一长串，估计 栈爆了。


;(+ 2 'a)
;; 会触发异常 ok的



(defun add-on (x)
  (cond ((symbolp x)
         (setq list (cons x list)))
        ((listp x)
         (setq list (append x list)))
        (t
         (error "invalid argument %s in add-on" x)))
;(add-on('(1 3)))
;; 怎么调用？


;type-of(1.1)
;; 错误的调用方法  invalid function


type-of 1
;; 1 ..也是错误的

(type-of 1)
;; integer  正确

(type-of 'nil)
;; symbol

(type-of '())
;; symbol


(type-of '(x))
;; cons

(type-of (record 'foo))
;; foo



(eq 1 1)
;; t

(eq 'fff 'fff)
;; t

(eq ?A ?A)
;; t

(eq 3.0 3.0)
;; nil . 书上是 nil or t，都可能

(eq (make-string 3 ?A) (make-string 3 ?A))
;; nil, 书上也是 nil。 这个 挺反常的

;(eq (make-string 3 "a") (make-string 3 "a"))
;; 语法错误。。 a, 'a' 也试过，不行

(eq "asd" "asd")
;; nil, 书上是 nil or t

(eq "A" "A")
;; nil

(eq '(1(2(3))) '(1(2(3))))
;; nil

(setq foo '(1(2(3))))
(eq foo foo)
;; void variable foo

(eq [1 2 3] [1 2 3])
;; nil



(eq (make-symbol "foo") 'foo)
;; nil


(equal "A" "A")
;; t


(equal-including-properties "A" (propertize "A" 'A t))
;; nil


(equal "A" (propertize "A" 'A t))
;; t

