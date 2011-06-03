require 'rubygems'

gem 'rdoc'
require 'rdoc/rdoc'

# TODO:
#  - cmd line value mapper
#  - cmd line class/module/method mapper
#  - figure out how to support instance methods

##
# TRb lets you run methods in ruby files from the command line
# to forgo entirely the need for task DSLs.
#
# By default, TRb recognizes and loads files matching *.t.rb.
# If no file has a valid matching method path, TRb will attempt to
# autoload *.rb files that look most likely to contain the method path.

class TRb

  # This gem's version.
  VERSION = '1.0.0'

  # What files to autoload by default.
  DEFAULT_TASK_FILES = %w{*.t.rb trb/*.rb trb/*.t.rb tasks/*.rb tasks/*.t.rb}


  class << self
    attr_accessor :tasks, :files_loaded
  end

  self.tasks        = {}
  self.files_loaded = {}


  RDOC = RDoc::RDoc.new
  RDOC.options = RDoc::Options.new


  ##
  # Creates a TRb instance with specified glob or files to load.

  def initialize files=nil
    self.class.load_files files.to_a.concat(DEFAULT_TASK_FILES)
  end


  ##
  # Check if a file has already been loaded.

  def self.file_loaded? path
    self.files_loaded[path]
  end


  ##
  # Load any number of files to build tasks from.

  def self.load_files *files
    files.map! do |path|
      path = File.expand_path path
      path = "#{path}.rb" unless File.file? path
      path
    end

    RDOC.parse_files(files).each do |top_lvl|
      build_tasks_from_rdoc top_lvl
      files_loaded[top_lvl.full_name] = true
    end

    true
  end


  ##
  # Recursively build tasks from a RDoc::TopLevel instance.

  def self.build_tasks_from_rdoc top_lvl
    
  end


  ##
  # Parses command line arguments.

  def self.parse_args argv
  end


  ##
  # Runs the trb command.

  def self.run argv=ARGV
    require 'trb/core_ext'
  end
end
