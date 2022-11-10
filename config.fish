alias please="sudo"
alias dco="docker compose"
alias dff="kitty +kitten diff"

set -x MINIKUBE_IN_STYLE true
set -g theme_newline_cursor yes
set PATH ~/go/bin $PATH

function dr
    docker run --rm -it -v (pwd):/app -w /app $argv
end

function dps
    for i in (docker ps --no-trunc --format '{{json .}}')
        set i (echo $i | jq "{Names: .Names,ID: .ID,Image: .Image,Ports: .Ports,Command: .Command,CreatedAt: .CreatedAt,LocalVolumes: .LocalVolumes,Mounts: .Mounts,Networks: .Networks,RunningFor: .RunningFor,Size: .Size,Status: .Status}")
        echo $i | json2yaml
        echo ''
    end | ccat
end
