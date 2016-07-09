#!/usr/bin/env ruby
# callowaylc@gmail
# includes individual tasks

## tasks ########################################

desc "start rtorrent session"
task :run, [ :command ] do | t, arguments |
  exec %{
    sudo docker run \
      -it \
      --name="rtorrent-0" \
      --volume="/docker/rtorrent-0/session:/tmp/rtorrent/session" \
      --volume="/docker/rtorrent-0/download:/tmp/rtorrent/download" \
        callowaylc\rtorrent \
          -d /tmp/rtorrent/download \
          -s /tmp/rtorrent/session \
          -o download_rate=0 \
          -o upload_rate=0 \
          -o port_random=yes

  }
end

## methods ######################################

private def command bash
  IO.popen bash do | io |
    while (char = io.getc) do
      print char
    end
  end
end

private def name
  'salt-master-0'
end

private def home
  File.dirname  __FILE__
end