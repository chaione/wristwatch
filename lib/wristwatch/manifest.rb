module Wristwatch
  class Manifest < Hash

    def build
      instance_eval instructions
    end

    def add_task(name, *args, &blk)
      raise ArgumentError, "Wristwatch manifests require that you pass a block to be executed" unless block_given?
      self[name] = [] unless has_key?(name)
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