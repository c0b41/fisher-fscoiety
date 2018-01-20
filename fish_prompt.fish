function fish_prompt
  set -l emoji    "⚡"
  set -l nick     $nickname
  set -l code     $status
  set -l nodev  (eval node --version)
  set -l phpv  (eval php -v | head -n 1 | cut -c4-9 | awk '{$1=$1};1')
  set -l cyan     (set_color -o cyan)
  set -l yellow   (set_color -o yellow)
  set -l red      (set_color -o red)
  set -l blue     (set_color -o blue)
  set -l green    (set_color -o green)
  set -l purple   (set_color -o purple)
  set -l normal   (set_color -o normal)

  echo -n -e (begin
    test $code = 0
      and echo "$red ~ $nick $normal [$green Node $nodev $normal] $normal [$green PHP $phpv $normal] \n"
  end) "$cyan"(prompt_pwd) (begin
    echo "$normal git:("$normal(git_branch_name)"$normal)"
    git_is_touched; and echo "$yellow⇡⇡"
  end) " $normal\n $yellow$emoji  "
end
