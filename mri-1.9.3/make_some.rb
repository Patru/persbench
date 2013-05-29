#encoding: UTF-8
require './connect_db'
require './model/little_object'
require 'benchmark'

class MakeSome
  def self.make(count)
    Benchmark.bm(5) do |benchmark|
      benchmark.report("just create some objects      ") do
        count.times do LittleObject.random end
      end
      benchmark.report("add objects to ruby array     ") do
        ar = []
        count.times do ar << LittleObject.random end
      end
      benchmark.report("save the random objects       ") do
        count.times do LittleObject.random.save end
      end
      LittleObject.delete_all
      benchmark.report("one transaction to save       ") do
        LittleObject.transaction do
          count.times do LittleObject.random.save! end
        end
      end
      LittleObject.delete_all
      #x.report("Maglev Array one commit search") do
      #  Maglev::PERSISTENT_ROOT[:bench_array2]=[]
      #  count.times do Maglev::PERSISTENT_ROOT[:bench_array2] << LittleObject.random end
      #  Maglev.commit_transaction
      #end
      #x.report("Maglev Array each commit      ") do
      #  Maglev::PERSISTENT_ROOT[:bench_array3]=[]
      #  count.times do
      #    Maglev::PERSISTENT_ROOT[:bench_array3] << LittleObject.random
      #    Maglev.commit_transaction
      #  end
      #end
    end
  end
end

MakeSome.make(10000)