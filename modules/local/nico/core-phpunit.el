(defun core-phpunit ()
  (interactive)
  (async-shell-command
   (concat
    "cd ~ && "
    "phpunit --bootstrap=core/test/phpunit/phpunit.php "
    buffer-file-name)))

(defun replace-mockery ()
  (interactive)

  (replace-mockery-getmock)
  (beginning-of-buffer)
  (replace-string "$this->getMockBuilder('" "m::mock(\\")

  (beginning-of-buffer)
  (replace-string "->method(" "->shouldReceive(")

  (replace-mockery-throw)
  (replace-mockery-returnvalue)
  (beginning-of-buffer)
  (replace-string "->will($this->returnCallback(" "->andReturn(")
  (beginning-of-buffer)
  (replace-string "->will(" "->andReturn(")

  (beginning-of-buffer)
  (replace-string "->expects($this->any())" "")
  (replace-mockery-expects)

  (beginning-of-buffer)
  (replace-string "$this->equalTo(" "")
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

;; mockeryのandReturnに置き換えていく
(defun replace-mockery-returnvalue ()
  (interactive)
  (beginning-of-buffer)
  (replace-regexp "->will($this->returnValue(\\([^()]+\\)))" "->andReturn(\\1)"))

;; mockeryのandThorwに置き換えていく
(defun replace-mockery-throw ()
  (interactive)
  (beginning-of-buffer)
  (replace-regexp "->will($this->throwException(\\([^()]+\\)))" "->andThrow(\\1)"))

;; once() とか times() に置き換える
(defun replace-mockery-expects ()
  (interactive)
  (beginning-of-buffer)
  (replace-regexp "->expects($this->once())->shouldReceive(\\([^()]+\\))" "->shouldReceive(\\1)->once()"))
