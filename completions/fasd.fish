function __print_fasd_completion_args -d "fasd internal / print possible values for given argument"
  if test $argv = "e"; and echo "subl atom"; end
  if test $argv = "b" -o $argv = "B"; and echo "spotlight viminfo recently-used current"; end
  if test ! $argv = "e" -o ! $argv = "b" -o ! $argv = "B"; and echo ""; end
end

function __print_fasd_completion -d "fasd internal / print description for given argument"
  if test $argv = "s"; and echo "List all paths and scores"; end
  if test $argv = "l"; and echo "List paths without scores"; end
  if test $argv = "i"; and echo "Interactive mode"; end
  if test $argv = "e"; and echo "Set command to execute on the result file"; end
  if test $argv = "b"; and echo "Only use given backend"; end
  if test $argv = "B"; and echo "Add additional backend"; end
  if test $argv = "a"; and echo "Match files and directories"; end
  if test $argv = "d"; and echo "Match directories only"; end
  if test $argv = "f"; and echo "Match files only"; end
  if test $argv = "r"; and echo "Match by rank only"; end
  if test $argv = "t"; and echo "Match by recent access only"; end
  if test $argv = "R"; and echo "Reverse listing order"; end
  if test $argv = "h"; and echo "Show a brief help message"; end
end

function __set_fasd_completion -d "fasd internal / set completion for all alphabetical arguments"
  set -lx args s l i e b B a d f r t r h
  for arg in $args
    complete -c fasd -s "$arg" -d "(__print_fasd_completion $arg)" -a "(__print_fasd_completion_args $arg)" -f
  end
end

complete -c fasd -f     # don't suggest files
__set_fasd_completion   # set all completions
