module Kernel

  alias rb_require require

  def self.require str
    return unless rb_require(str) && defined?(TRb)
    TRb.load_files str
  end
end

alias rb_require require

def require str
  Kernel.require str
end
