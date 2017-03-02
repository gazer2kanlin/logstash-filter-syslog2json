# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"

require "java"
require "packet.syslog.0.0.1-SNAPSHOT.jar"

# This  filter will replace the contents of the default 
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an .
class LogStash::Filters::Syslog2json < LogStash::Filters::Base

  config_name "syslog2json"
  
  # Replace the message with this value.
  # config :message, :validate => :string, :default => "Hello Syslog2json!"
  

  public
  def register
    # Add instance variables 
    @s2j = Java::uia.nda.packet.syslog.SysLog2Json.new
  end # def register

  public
  def filter(event)

    # use java API to convert Syslog text to json format.
    json = @s2j.read(event.get("message"))
    event.set("message", json)

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Syslog2json
