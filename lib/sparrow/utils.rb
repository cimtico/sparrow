class Class # :nodoc:
  def spar_cattr_reader(*syms)
    syms.flatten.each do |sym|
      next if sym.is_a?(Hash)
      class_eval(<<-EOS, __FILE__, __LINE__)
        unless defined? @@#{sym}
          @@#{sym} = nil
        end

        def self.#{sym}
          @@#{sym}
        end

        def #{sym}
          @@#{sym}
        end
      EOS
    end
  end

  def spar_cattr_writer(*syms)
    syms.flatten.each do |sym|
      class_eval(<<-EOS, __FILE__, __LINE__)
        unless defined? @@#{sym}
          @@#{sym} = nil
        end

        def self.#{sym}=(obj)
          @@#{sym} = obj
        end

        def #{sym}=(obj)
          @@#{sym} = obj
        end
      EOS
    end
  end

  def spar_cattr_accessor(*syms)
    spar_cattr_reader(*syms)
    spar_cattr_writer(*syms)
  end
end

class Module # :nodoc:
  def spar_mattr_reader(*syms)
    syms.each do |sym|
      next if sym.is_a?(Hash)
      class_eval(<<-EOS, __FILE__, __LINE__)
        unless defined? @@#{sym}
          @@#{sym} = nil
        end
        
        def self.#{sym}
          @@#{sym}
        end

        def #{sym}
          @@#{sym}
        end
      EOS
    end
  end
  
  def spar_mattr_writer(*syms)
    syms.each do |sym|
      class_eval(<<-EOS, __FILE__, __LINE__)
        unless defined? @@#{sym}
          @@#{sym} = nil
        end
        
        def self.#{sym}=(obj)
          @@#{sym} = obj
        end
        
        def #{sym}=(obj)
          @@#{sym} = obj
        end
      EOS
    end
  end
  
  def spar_mattr_accessor(*syms)
    spar_mattr_reader(*syms)
    spar_mattr_writer(*syms)
  end
end


module Sparrow
  module Miscel
    def options
      Sparrow.options
    end
  
    def options=(ob)
      Sparrow.options = ob
    end
  
    def base_dir
      Sparrow.base_dir
    end
  
    def log_path
      Sparrow.log_path
    end
  
    def pid_dir
      Sparrow.pid_dir
    end
    
    def logger
      Sparrow.logger
    end
  end
end