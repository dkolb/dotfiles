function posix-source
  for i in (cat $argv)
    set arr (echo $i |tr = \n)
      set value (echo $arr[2]| sed "s/'//g")
      set -gx $arr[1] $value
  end
end
