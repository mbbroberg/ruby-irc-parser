#!/usr/bin/env ruby

require 'typhoeus'

# NOTE - first date that returns conversation is 2010-3-12

month = "March.txt"
#Typhoeus.get("http://www.irclogger.com/.riak/2015-02-04")
downloaded_file = File.open month, 'wb'


request = Typhoeus::Request.new("http://www.irclogger.com/.riak/2015-02-04")
request.on_headers do |response|
  if response.code != 200
    raise "Request failed"
  end
end
request.on_body do |chunk|
  downloaded_file.write(chunk)
end
request.on_complete do |response|
  downloaded_file.close
  # Note that response.body is ""
end
request.run
