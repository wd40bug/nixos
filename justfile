alias sr := switch-rebuild
alias br := build-rebuild
gen := `git log -1 --pretty=%B | sed -E 's/.*generation ([0-9]+).*/\1/'`

switch-rebuild: commit
  sudo nixos-rebuild switch

build-rebuild: commit
  sudo nixos-rebuild build

switch-rebuild-no-commit:
  sudo nixos-rebuild switch

build-rebuild-no-commit:
  sudo nixos-rebuild build

commit:
  git add .
  git commit -m "generation $(({{gen}} + 1))"

get-gen:
  @echo "generation {{gen}}"

next-gen:
  echo "generation $(({{gen}} + 1))"
