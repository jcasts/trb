require 'rubygems'
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


  attr_accessor :tasks, :files_loaded


  ##
  # Creates a TRb instance with specified glob or files to load.

  def initialize files=nil
    @tasks        = {}
    @files_loaded = []

    @rdoc         = RDoc::RDoc.new
    @rdoc.options = RDoc::Options.new

    self.load_files files.to_a.concat(DEFAULT_TASK_FILES)
  end


  ##
  # Load any number of files to run.

  def load_files *files
  end


  ##
  # Parses command line arguments.

  def self.parse_args argv
  end


  ##
  # Runs the trb command.

  def self.run argv=ARGV
  end
end
