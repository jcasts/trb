module Kernel

  alias rb_require require

  def self.require str
    return unless rb_require(str) && defined?(TRb)

    path = File.expand_path str
    path = "#{path}.rb" unless File.file? path

    TRb.load_files path if File.file? path
  end
end

alias rb_require require

def require str
  Kernel.require str
end
