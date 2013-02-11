module CLIHelpers
  def run(&block)
    capture_stdout do
      yield
    end
  end

  def run_silent(cmd)
    silence_stream($stdout) { run(cmd) }
  end

  def run_silent!(cmd)
    silence_stream($stderr) { run_silent(cmd) }
  end

  def capture_stdout
    real_stdout, $stdout = $stdout, StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = real_stdout
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
