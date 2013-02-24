def savepoint(filename, &block)
  dumpfile = File.join File.dirname($0), filename
  if File.exist?(dumpfile)
    print "Loading #{dumpfile} ... "
    result = Marshal.load File.read(dumpfile)
    puts 'Done.'
  else
    result = yield
    print "Saving result to #{dumpfile} ... "
    File.write dumpfile, Marshal.dump(result)
    puts 'Done.'
  end
  result
end

start_time = Time.now
at_exit do
  end_time = Time.now
  puts "FINISH: #{end_time.strftime('%H:%M:%S')}, #{(end_time - start_time).to_i} seconds elapsed."
end
puts "START:  #{start_time.strftime('%H:%M:%S')}"
