;; TODO php-modeの機能で関数名を取るようにしたうえで nico-php-mode の方に移動する
;; http://www.utakata.work/entry/20181201/1543629600

(defun get-buffer-file-name ()
  (interactive)
  (message buffer-file-name))

(defun replace-mockery ()
  (interactive)

  ;; getmock
  (replace-mockery-getmock)

  (beginning-of-buffer)
  (replace-string "->method(" "->shouldReceive(")

  (replace-mockery-returnvalue)

  (beginning-of-buffer)

  ;; getMockBuilder
  (replace-mockery-getmockbuilder)
  (replace-mockery-willreturn)

  (replace-mockery-expects)

  (replace-mockery-withconsecutive-alert)
  (beginning-of-buffer)
  (replace-regexp "->withAnyParameters()" "")
  )

;; $this->getMock() を Mockeryに置き換えていく
(defun replace-mockery-getmock ()
  (interactive)
  ;;  $this->getMock('Database', ['get_count_of_user']) みたいなのを置き換える
  (beginning-of-buffer)
  (replace-regexp "$this->getMock('\\([^(),]+\\)',[^()]+)" "m::mock(\\1::class)")

  ;; $this->getMock('Database') みたいなのを置き換える
  (beginning-of-buffer)
  (replace-regexp "$this->getMock('\\([^()]+\\)')" "m::mock(\\1::class)")

  ;; それ以外はまとめて置き換える
  (beginning-of-buffer)
  (replace-string "$this->getMock(" "m::mock("))



(defun replace-mockery-getmockbuilder ()
  (interactive)
  ;; $ths->getMockBuilder('Database', ...) みたいなのを置き換える
  (beginning-of-buffer)
  (replace-regexp "$this->getMockBuilder('\\([^(),]+\\);?',[^()]+)" "m::mock(\\1::class);")

  ;; $this->getMockBuilder('Database') みたいなのを置き換える
  (beginning-of-buffer)
  (replace-regexp "$this->getMockBuilder('\\([^()]+\\)');?" "m::mock(\\1::class);")

  ;; それ以外のパターンはとりあえずそのまま置き換える
  (beginning-of-buffer)
  (replace-string "$this->getMockBuilder(\\([^()]+\\))" "m::mock(\\1)")

  ;; $this->anything() を m::any() に置き換える
  (beginning-of-buffer)
  (replace-string "$this->anything()" "m::any()")

  ;; いらないメソッドを消す
  ;; $this->getMockBuilder(Class)->disableOriginalConstructor()->getMock();
  ;; のようなものを正しく置き換える
  (beginning-of-buffer)
  (replace-string "->disableOriginalConstructor()" "")
  (beginning-of-buffer)
  (replace-string "->getMock();" "")
  (beginning-of-buffer)
  (replace-regexp "->setMethods([^()]+)" "")
  )


;; mockeryのandReturnに置き換えていく
(defun replace-mockery-returnvalue ()
  (interactive)
  ;; まず throwException を置き換えていく
  (beginning-of-buffer)
  (replace-regexp
   (concat "->will(" "[\s\t\n]*" "$this->throwException(" "[\s\t\n]*" "\\([^()]+\\)" "[\s\t\n]*" ")" "[\s\t\n]*" ")")
   "->andThrow(\\1)")

  (beginning-of-buffer)
  (replace-regexp "->will($this->throwException(\\(.+?\\)))" "->andThrow(\\1)")

  ;; returnCallback を置き換えていく
  ;; TODO 適当な置き換え状態
  (beginning-of-buffer)
  (replace-string "->will($this->returnCallback(" "->andReturn(")

  ;; returnValue を置き換えていく
  (beginning-of-buffer)
  (replace-regexp
   (concat "->will(" "[\s\t\n]*" "$this->returnValue(" "[\s\t\n]*" "\\([^()]+\\)" "[\s\t\n]*" ")" "[\s\t\n]*" ")")
   "->andReturn(\\1)")

  (beginning-of-buffer)
  (replace-regexp
   (concat "->will(" "[\s\t\n]*" "$this->returnValue(" "[\s\t\n]*" "\\(.+?\\)" "[\s\t\n]*" ")" "[\s\t\n]*" ")")
   "->andReturn(\\1)")

  ;; 上記に引っかからなかったら一律 will を andReturn に置き換えてしまう
  ;; 基本的にはこれであんまり問題は怒らないはず
  (beginning-of-buffer)
  (replace-string "->will(" "->andReturn(")

  ;; will が andReturn に置き換わったら、残っている$this->returnValueは不要なので消す
  (beginning-of-buffer)
  (replace-regexp "$this->returnValue(\\(.+?\\))" "\\1")
  ;; 上記ケースにマッチしなかったらこっちで消してしまう。最終手段
  ;; ただし、括弧の数に不整合が起こるので手動で解決する必要がある
  (beginning-of-buffer)
  (replace-string "$this->returnValue(" "")
  )


(defun replace-mockery-willreturn ()
  (interactive)
  (beginning-of-buffer)
  (replace-string "->willReturn(" "->andReturn("))


;; once() とか times() に置き換える
(defun replace-mockery-expects ()
  (interactive)

  (beginning-of-buffer)
  (replace-regexp
   "->expects($this->once())[\s\t\n]*->shouldReceive(\\([^()]+\\))"
   "->shouldReceive(\\1)->once()")

  (beginning-of-buffer)
  (replace-regexp
   "->expects($this->at([0-9]))[\s\t\n]*->shouldReceive(\\([^()]+\\))"
   "->shouldReceive(\\1)->once()")

  (beginning-of-buffer)
  (replace-regexp
   "->expects($this->atLeastOnce())[\s\t\n]*->shouldReceive(\\([^()]+\\))"
   "->shouldReceive(\\1)->atLeast()->once()")

  (beginning-of-buffer)
  (replace-regexp
   "->expects($this->exactly(\\([2-9]\\)))[\s\t\n]*->shouldReceive(\\([^()]+\\))"
   "->shouldReceive(\\2)->times(\\1)")

  (beginning-of-buffer)
  (replace-regexp
   "->expects($this->never())[\s\t\n]*->shouldReceive(\\([^()]+\\))"
   "->shouldReceive(\\1)->never()")

  ;; any() は不要なので削除
  (beginning-of-buffer)
  (replace-string "->expects($this->any())" "")
  )



(defun replace-mockery-hamcrest ()
  (interactive)
  (beginning-of-buffer)
  (replace-regexp "$this->equalTo(" "h::equalTo(")

  (beginning-of-buffer)
  (replace-regexp "$this->identicalTo(" "h::identicalTo(")
  )

;; equalToで比較しなくても行けるので消しちゃうやつ
(defun remove-hamcrest-equalto ()
  (interactive)
  (beginning-of-buffer)
  (replace-regexp "h::equalTo(\\([^()]+\\))" "\\1")
  (beginning-of-buffer)
  )

(defun replace-logicalor-hamcrest ()
  (interactive)
  (beginning-of-buffer)
  (replace-regexp "$this->logicalOr(" "h::anyOf(")
  )

;; 自動で直すのは辛いので手動で頑張ってもらう
(defun replace-mockery-withconsecutive-alert ()
  (interactive)
  (beginning-of-buffer)
  (replace-regexp "->withConsecutive(" "TODO: fix ->withConsecutive(")
  )
