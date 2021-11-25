function music-dl
  if test -z $argv
    set current_command (status current-command)
    echo 'Please give me a file that contains the URL(s)'
    echo "Usage: $current_command somefile.txt"
  else
    set MAXPROCS (sysctl -n hw.ncpu)
    set FOLDER $HOME/Music/(date +"%m-%d-%Y")-(uuidgen | cut -d - -f 1)
    mkdir -p $FOLDER
    xargs -I {} -P $MAXPROCS \
    youtube-dl --extract-audio \
               --audio-format mp3 \
               --audio-quality 0 \
               --restrict-filenames \
               --ignore-errors \
               --no-mtime \
               --output "$FOLDER/%(title)s.%(ext)s" \
               {} < $argv
  end
end
