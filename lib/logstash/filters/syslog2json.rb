# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"

require "java"
require "java/commons-lang3-3.1.jar"
require "java/grok-0.1.5.jar"
require "java/gson-2.7.jar"
require "java/packet-core-0.0.1-SNAPSHOT.jar"
require "java/packet.syslog-0.0.1-SNAPSHOT.jar"
require "java/simple-xml-2.7.1.jar"
require "java/slf4j-api-1.7.5.jar"
require "java/slf4j-simple-1.7.5.jar"
require "java/stax-1.2.0.jar"
require "java/stax-api-1.0.1.jar"
require "java/syslog.we-0.0.1-SNAPSHOT.jar"
require "java/xpp3-1.1.3.3.jar"

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
    @helper = Java::uia.nda.packet.syslog.SysLogHelper.new
  end # def register

  public
  def filter(event)

    # use java API to convert Syslog text to json format.
    json = @helper.parse2EsDoc(event.get("message"))
    event.set("message", json)

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Syslog2json
