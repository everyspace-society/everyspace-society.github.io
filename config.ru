require 'bundler/setup'
require 'sinatra/base'

class String
   def decamelize!
      self.gsub!(/(.)([A-Z])/, '\1-\2').downcase!
   end
   def decamelize
      self.gsub(/(.)([A-Z])/, '\1-\2').downcase
   end
end
gem 'rack-rewrite', '~> 1.5.0'
require 'rack/rewrite'

use Rack::Rewrite do
   r301 %r{([[:upper:]][\w]*(?:-\w+)*[\.\/][[:upper:]][[:alnum:]]*(?:[[:upper:]][[:lower:]0-9]|[[:lower:]0-9][[:upper:]])[[:alnum:]]*)}, lambda {|match, rack_env|
      answer = match[1].split(/[\.\/]/).map{|b| b.decamelize}.join('/')
   }
end

# The project root directory
$root = ::File.dirname(__FILE__)

class SinatraStaticServer < Sinatra::Base

  get(/.+/) do
    send_sinatra_file(request.path) {404}
  end

  not_found do
    send_file(File.join(File.dirname(__FILE__), 'public', '404.html'), {:status => 404})
  end

  def send_sinatra_file(path, &missing_file_block)
    file_path = File.join(File.dirname(__FILE__), 'public',  path)
    file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i
    File.exist?(file_path) ? send_file(file_path) : missing_file_block.call
  end

end

run SinatraStaticServer
