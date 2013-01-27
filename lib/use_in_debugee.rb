# -*- encoding: utf-8 -*-

module UseInDebugee
  # The following method is used in debugee source.
  #
  # Example:
  #     arr.d('t01:').sort.uniq
  def d(str)
    tag, _ = str.split(':')
    target_fname = caller[0][/^(.+):[0-9]+:(?:[^:]+)$/, 1]
    logger.debug "(insert:#{target_fname}:#{str}:#{self.inspect.gsub("'", "\\'"})"
    self
  end
end
