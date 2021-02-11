module Enumerable
  # @author <billau_l@modulotech.fr>
  # Each with_info, usefull for debuging purpose and big task progress visibility in terminal
  # @example 1.upto(666).each.with_info(:annoying_loop) {|e| sleep 0.1}
  def with_info(named='', &block)
    # run count only one time
    count = self.count
    # store loop start time
    start_time = Time.zone.now
    # expected remaining time
    remaining_time = nil
    # int to time formater
    format = -> (time) { (((time / 60).round > 0) ? "#{(time/60).round}m" : '') + "#{(time % 60).round(2)}s" }
    # get current index
    self.with_index do |value, index|
      # time spend from start
      elapsed_time = (Time.zone.now-start_time)
      # progress in percent
      percent = index == 0 ? 0 : (index.to_f/count*100)
      # calculate remaining time after one second of execution
      if (percent > 0 && elapsed_time >= 1)
        # estimated remaining time is updated at each loop
        remaining_time = ((100 / percent) * elapsed_time) - elapsed_time
      end

      # Output splited for readabilty,
      print([
        # Erase the current line
        "\r",
        # Name and percent
        "#{named} #{('%0.2f' % percent).rjust(7, ' ')}%",
        # current item / index
        "#{(index+1).to_s.rjust(count.to_s.length, ' ')}/#{count}",
        # Time spend
        "#{format.call(elapsed_time)}",
        # Remaining Time
        "(eta: #{remaining_time.present? ? format.call(remaining_time) : '...'})"
      ].join(' '))
      # Finaly call the block on the current value
      block.call(value)
    end
  end
end
