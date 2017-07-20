module ScentsHelper
  def sniff_test(howl)
    stenches = []
    howl.scents.all.each do |scent|
      stenches << scent.stench
    end
    stenches.group_by(&:itself).values.max_by(&:size).first
  end
end
