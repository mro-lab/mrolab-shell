#!/bin/bash -Eeu
trap 'echo "ERROR: ${0}:${LINENO} > ${BASH_COMMAND} [${?}] (${SECONDS}sec)" 1>&2' ERR
shopt -s inherit_errexit
shopt -s expand_aliases
set -o pipefail

# 初期化
REAL_PATH=$(realpath "${0}")
BASH_NAME="${REAL_PATH##*/}"
BASH_HOME="${REAL_PATH%/*}"
TOOL_HOME="${TOOL_HOME:-$(realpath ${BASH_HOME}/..)}"
source ${BASH_HOME}/import  # パスは適宜修正

# 引数解析
argp "${@}"

# 実行関数1
function exec1 {
  echo "EXEC1"
}

# 実行関数2
function exec2 {
  echo "EXEC2"
}

# 実行関数3
function exec3 {
  echo "EXEC3"
}

#-------------------------------------
# action #
case "${ARGP[0]:-}" in
    exec1)                        exec1                       "${ARGP[@]:1}" ;;   # 実行関数1
    exec2)                        exec2                       "${ARGP[@]:1}" ;;   # 実行関数2
    exec3)                        exec3                       "${ARGP[@]:1}" ;;   # 実行関数3
    *)                            usage                       "${ARGP[@]:1}" ;;   # 使い方
esac
