#!/usr/bin/env ruby
# callowaylc@gmail
# includes individual tasks

## tasks ########################################

desc "start rtorrent session"
task :run do | t, arguments |
  exec %{
    sudo docker rm -f #{ name } > /dev/null 2>&1
    sudo docker run \
      -it \
      --rm \
      --name="#{ name }" \
      --volume="/docker/rtorrent-0/session:/tmp/torrent/session" \
      --volume="/docker/rtorrent-0/download:/tmp/torrent/download" \
      --volume="/docker/rtorrent-0/torrent:/tmp/torrent/torrent" \
        callowaylc/rtorrent:latest \
          -n \
          -d /tmp/torrent/download \
          -s /tmp/torrent/session \
          -o download_rate=0 \
          -o upload_rate=0 \
          -o port_random=yes

  }
end

desc "convert magnet link to torrent"
task :magnet, [ :uri ] do | t, arguments |
  exec %{
    sudo docker run \
      --rm \
      --entrypoint="/usr/local/bin/magnet-to-torrent" \
      --volume="/docker/rtorrent-0/torrent:/tmp/torrent/torrent" \
        callowaylc/rtorrent \
          "#{ arguments[:uri] }" /tmp/torrent/torrent
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
  'rtorrent-0'
end

private def home
  File.dirname  __FILE__
end
