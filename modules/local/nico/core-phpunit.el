(defun core-phpunit ()
  (interactive)
  (async-shell-command
   (concat
    "cd ~ && "
    "phpunit --bootstrap=core/test/phpunit/phpunit.php "
    buffer-file-name)))

(defun replace-mockery ()
  (interactive)
  (beginning-of-buffer)
  (replace-string "$this->getMock('" "m::mock(\\")
  (beginning-of-buffer)
  (replace-string "$this->getMock(" "m::mock(")
  (beginning-of-buffer)
  (replace-string "$this->getMockBuilder('" "m::mock(\\")

  (beginning-of-buffer)
  (replace-string "->method(" "->shouldReceive(")

  (beginning-of-buffer)
  (replace-string "->will($this->throwException(" "->andThrow(")
  (beginning-of-buffer)
  (replace-string "->will($this->returnValue(" "->andReturn(")
  (beginning-of-buffer)
  (replace-string "->will($this->returnCallback(" "->andReturn(")
  (beginning-of-buffer)
  (replace-string "->will(" "->andReturn(")

  (beginning-of-buffer)
  (replace-string "$this->equalTo(" "")
  )
