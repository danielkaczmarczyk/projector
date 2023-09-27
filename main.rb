require 'fileutils'

DESTINATION = File.expand_path "~/.projector.json"
CONFIG_TEMPLATE = "./template.json"

def status
  puts "current pwd: #{Dir.pwd}"
end

def set_working_directory_to_script_location
  script_path = File.expand_path(__FILE__)

  script_directory = File.dirname(script_path)

  Dir.chdir(script_directory)
end

def copy_init
  File.open(DESTINATION, 'w') do |file|
  end
  # FileUtils.touch(DESTINATION)
  FileUtils.copy(CONFIG_TEMPLATE, DESTINATION)
end

def check_for_dotfile
  if File.exist?('~/.projector.json')
    puts 'projector configuration file present'
  else
    puts 'projector configuration file missing'
    puts 'do you want to create it?'
    response = gets.chomp

    if ['y', 'yes', 'ok'].include? response
      copy_init
    else
      puts 'aborting'
    end
  end
end

def main
  set_working_directory_to_script_location
  status
  check_for_dotfile
end

main

