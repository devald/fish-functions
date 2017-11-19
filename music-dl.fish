function music-dl
  if test -z $argv
    echo 'Please give me a file that contains the URL(s)'
  else
    set FOLDER $HOME/Music/(date +%Y-%m-%d_%H-%M)-(date +%S | md5 | cut -c 1-4)
    mkdir -p $FOLDER
    youtube-dl --batch-file $argv \
               --extract-audio \
               --audio-format mp3 \
               --audio-quality 0 \
               --output "$FOLDER/%(title)s.%(ext)s"
  end
end
