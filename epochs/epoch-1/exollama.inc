ID=1
if [ "x$1" != "x" ]; then
  ID=$1
fi
EXOLLAMA_ROOT="../.."
if [ -d "/usr/local/exollama" ]; then
  EXOLLAMA_ROOT="/usr/local/exollama"
fi
EXOLLAMA_BRANCH="exo"
