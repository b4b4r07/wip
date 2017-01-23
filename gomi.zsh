#!/bin/zsh

# if [[ -n $ZSH_VERSION ]]; then
#     if (( $+commands[fzf] )); then
#         # Add to the PATH
#         export PATH=$PATH:${0:A:h}/bin
#         fpath=(${0:A:h}/src(N-/) $fpath)
#     fi
# fi

ltsv() {
    local user_awk_script="$1" ltsv_awk_script
    ltsv_awk_script=$(cat <<-'EOS'
    function key(name) {
        for (i = 1; i <= NF; i++) {
            match($i, ":");
            xs[substr($i, 0, RSTART)] = substr($i, RSTART+1);
        };
        return xs[name":"];
    }
EOS
    )
    awk -F'\t' "${ltsv_awk_script} ${user_awk_script}"
}

