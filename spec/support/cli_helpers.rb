module CLIHelpers
  def run(cmd)
    system(cmd)
  end

  def run_silent(cmd)
    silence_stream($stdout) { run(cmd) }
  end

  def run_silent!(cmd)
    silence_stream($stderr) { run_silent(cmd) }
  end

  private

  def silence_stream(stream)
    orig_stream = stream.dup
    stream.reopen('/dev/null')
    stream.sync = true
    yield
  ensure
    stream.reopen(orig_stream)
  end
end
