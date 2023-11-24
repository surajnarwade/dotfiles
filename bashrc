# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH=$PATH:$HOME/.local/bin

#-------------------------------------
# All Things Git

# Bash Git Prompt
source ~/.bash-git-prompt/gitprompt.sh
GIT_PROMPT_ONLY_IN_REPO=1

# aliases

alias gpum='git pull --ff upstream master'
alias gpom='git pull --ff origin master'
alias gcm='git checkout master'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Pull PR 

function pr() {
    id=$1
    if [ -z $id ]; then
        echo "Need Pull request number as argument"
        return 1
    fi
    git fetch upstream pull/${id}/head:pr_${id}
    git checkout pr_${id}
    git rebase master -i
}

#-------------------------------------

# All Things Golang

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN:/usr/local/go/bin
export CDPATH=.:$GOPATH/src/github.com:$GOPATH/src

#-------------------------------------

# All things Kubernetes

# Autocompletion
source <(kubectl completion bash)

# Change Namespace 
function change-ns() {
              namespace=$1
    if [ -z $namespace ]; then
        echo "Please provide the namespace name: 'change-ns mywebapp'"
        return 1
    fi

    kubectl config set-context $(kubectl config current-context) --namespace $namespace
}

# Check Current Namespace
function current-ns(){
	kubectl get sa default -o jsonpath='{.metadata.namespace}'
    echo
}

# aliases

alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get service'
