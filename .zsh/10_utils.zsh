# cd 後に自動で ls
function cd() { builtin cd $@ && ls;}

# encode
function urlencode
{
	echo $* | nkf -eMQ | tr = %
}
function urldecode
{
	echo $* | tr % = | nkf -emQ
}

# android
function androidScreenshot
{
	adb shell exit 2>/dev/null
	if [[ $? == 0 ]]; then
		dateString=`date +"%Y-%m-%d_%H.%M.%S"`
		fileName="ss_$dateString.png"
		adb shell screencap -p | perl -pe 's/\x0D\x0A/\x0A/g' > ~/Desktop/$fileName
	else
		echo "No android device connected."
	fi
}

# peco
function peco-select-history
{
	local tac
	if which tac > /dev/null; then
		tac="tac"
	else
		tac="tail -r"
	fi
	BUFFER=$(\history -n 1 | \
		eval $tac | \
		peco --query "$LBUFFER")
	CURSOR=$#BUFFER
	zle clear-screen
}
zle -N peco-select-history

function peco-src
{
	local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
	zle clear-screen
}
zle -N peco-src

