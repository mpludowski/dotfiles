alias please="sudo"

set -x MINIKUBE_IN_STYLE true
set -g theme_newline_cursor yes

function dr
    docker run --rm -it -v (pwd):/app -w /app $argv
end
