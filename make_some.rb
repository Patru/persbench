#encoding: UTF-8
require 'benchmark'

class MakeSome
  def self.make(count)
    Benchmark.bm(5) do |x|
      x.report("create                        ") do
        count.times do LittleObject.random end
      end
      x.report("Array                         ") do
        ar = []
        count.times do ar << LittleObject.random end
      end
      x.report("Maglev Array one commit       ") do
        ar = []
        count.times do ar << LittleObject.random end
        Maglev::PERSISTENT_ROOT[:bench_array1] =ar
        Maglev.commit_transaction
      end
      x.report("Maglev Array one commit search") do
        Maglev::PERSISTENT_ROOT[:bench_array2]=[]
        count.times do Maglev::PERSISTENT_ROOT[:bench_array2] << LittleObject.random end
        Maglev.commit_transaction
      end
      x.report("Maglev Array each commit      ") do
        Maglev::PERSISTENT_ROOT[:bench_array3]=[]
        count.times do
          Maglev::PERSISTENT_ROOT[:bench_array3] << LittleObject.random
          Maglev.commit_transaction
        end
      end
    end
  end
end

MakeSome.make(10000)