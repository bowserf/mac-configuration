# ADB

alias adbsearch="adb shell pm list packages | grep "
alias adbpath="adb shell pm path "
alias adblist="adb shell pm list packages"
alias adbinst="adb install "
alias adbuninst="adb uninstall "

# Android device

function screen() {
  if [ $# -eq 0 ]
  then
    name="screenshot.png"
  else
    name="$1.png"
  fi
  adb shell screencap -p /sdcard/$name
  adb pull /sdcard/$name ~/Desktop
  adb shell rm /sdcard/$name
  echo "Screenshot saved to ~/Desktop/$name"
}

# Navigation

alias goto="cd ~/Desktop"

# Git

alias add="git add ."
alias gc="git commit"
alias commit="git commit"
alias res="git reset -q --hard HEAD --"
alias cherrypick="git cherry-pick -x"
alias st="git status"
alias stash="git stash"
alias co="git checkout"
alias dev="git checkout dev"
alias master="git checkout master"
alias gp="git pull"
alias pull="git pull"
alias push="git push"
alias pushr="git push --set-upstream origin `git branch | grep \* | cut -d ' ' -f2`"
alias pushf="git push -f"
alias clone="git clone"
alias am="git commit --am"
alias amno="git commit --am --no-edit"
alias gfix="git add . && git commit --am --no-edit && git push -f"
alias merge="git merge"
alias rebd="git rebase dev"
alias rebase="git rebase"
alias rebasec="git rebase --continue"
alias rebases="git rebase --skip"
alias br="git branch"
alias brdel="git branch | grep -v \* | xargs git branch -D"
alias tag="git tag"
alias log="git log"
alias logme="git log --author=\"Frédéric\" --format=oneline"
alias logmemr="git log --author=\"Frédéric\" --format=oneline | grep -v \"Merge branch\""
alias clone1="git clone --depth 1 $1" # $1 is the repo url
alias clone1br="git clone --depth 1 --branch $1 $2" # $2 is the repo url

# Gitlab

function mr() {
  if [ $# -ne 1 ]; then
    echo "Usage: mr [branch_name]"
    return
  fi
  git add .
  git checkout -b "$1"
  git commit
  git push --set-upstream origin HEAD --push-option=merge_request.create --push-option=merge_request.label="mr::to-review"
}
function mrm() {
  if [ $# -ne 2 ]; then
    echo "Usage: mr [branch_name] [commit_message]"
    return
  fi
  git add .
  git checkout -b "$1"
  git commit -m "$2"
  git push --set-upstream origin HEAD --push-option=merge_request.create --push-option=merge_request.label="mr::to-review"
}