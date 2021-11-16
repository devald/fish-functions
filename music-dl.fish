function music-dl
  if test -z $argv
    echo 'Please give me a file that contains the URL(s)'
  else
    set FOLDER $HOME/Music/(date +"%m-%d-%Y")-(uuidgen | cut -d - -f 1)
    mkdir -p $FOLDER
    youtube-dl --batch-file $argv \
               --extract-audio \
               --audio-format mp3 \
               --audio-quality 0 \
               --ignore-errors \
               --output "$FOLDER/%(title)s.%(ext)s"
  end
end
