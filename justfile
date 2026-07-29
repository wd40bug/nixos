alias sr := switch-rebuild
alias sb := switch-build
gen := `git log -1 --pretty=%B | sed -E 's/.*generation ([0-9]+).*/\1/'`

switch-rebuild: commit
  sudo nixos-rebuild switch

switch-build: commit
  sudo nixos-rebuild build

commit:
  git add .
  git commit -m "generation {{gen}}"

get-gen:
  @echo "generation {{gen}}"

