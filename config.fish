alias please="sudo"
alias dco="docker-compose"

set -x MINIKUBE_IN_STYLE true
set -g theme_newline_cursor yes

function dr
    docker run --rm -it -v (pwd):/app -w /app $argv
end

function dps
    for i in (docker ps --format '{{json .}}')
        echo $i | json2yaml
        echo ''
    end | ccat
end
