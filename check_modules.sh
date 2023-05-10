join_by () { local IFS="$1"; shift; echo "$*"; }
declare -a excludedWorkflowModules=(
    '*Daml.Finance.Interface.*'
    '*Daml.Finance.Claims.*'
)
find_modules=$(find $1 -name "*.daml" -type f -print0 | xargs -0 grep -o "import Daml.Finance.*" | grep -Ev "$(join_by "|" ${excludedWorkflowModules[@]})")
if [[ $? == 0 ]]; then
    echo "These Files need to be fixed!"
    for i in $find_modules; do
        if [[ "$i" == *":"* ]]; then
            echo $i | cut -f1 -d:
        else
            continue
        fi
    done | sort -u
    exit 127
else
    exit 0
fi
