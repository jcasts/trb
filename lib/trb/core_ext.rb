module Kernel

  alias old_require require

  def self.require str
    puts "EXTENDED!" if File.file?(File.expand_path(str)) ||
                        File.file?(File.expand_path("#{str}.rb"))

    old_require str
  end
end

alias old_require require

def require str
  Kernel.require str
end
