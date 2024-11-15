function yta-pl --wraps='yt-dlp --extract-audio --audio-format opus -o "%(title)s.%(ext)s"' --description 'alias yta-pl=yt-dlp --extract-audio --audio-format opus -o "%(title)s.%(ext)s"'
  yt-dlp --extract-audio --audio-format opus -o "%(title)s.%(ext)s" $argv
        
end
