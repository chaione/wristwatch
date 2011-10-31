module Wristwatch
  class Manifest < Hash

    def build
      instance_eval instructions
      self
    end

    def add_task(name, *args, &blk)
      self[name] = [] unless self[name].respond_to?(:<<)
      self[name] << build_task(*args, &blk)
    end

    def instructions
      File.read('config/wristwatch_jobs.rb')
    end

    private

    def build_task(*args, &blk)
      Wristwatch::Task.new(*args, &blk)
    end

    def method_missing(meth, *args, &blk)
      if blk
        add_task(meth, *args, &blk)
      else
        super(meth, *args, &blk)
      end
    end
  end
end
