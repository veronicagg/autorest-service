require 'open3'
module GenerateHelper

  def self.execute_autorest(autorest_version, cmd_line_arguments)
    args = cmd_line_arguments.map{|k,v| "#{k} #{v.to_s}" unless (v.nil? or v.to_s.empty?)}.join(' ')
    puts "AutoRest Arguments: #{args}"
    puts "Installing AutoRest version: #{autorest_version}"
    system("nuget install AutoRest -Source https://www.myget.org/F/autorest/ -pre -OutputDirectory /output/ -Version #{autorest_version}")


    puts "Generating code..."
    # output_message = `mono AutoRest.*/tools/AutoRest.exe #{args}`
    # exit_code = $?.exitstatus
    # exit_error = $?
    # puts "Output: #{output_message}"
    # puts "Exit code #{exit_code}"
    # puts "Exit error #{exit_error}" unless exit_code == 0

    cmd = "mono AutoRest.*/tools/AutoRest.exe #{args}"
    Open3.popen2e(cmd) do |_, stdout_err, wait_thr|
      message = ""
      while line = stdout_err.gets
        message = message + line
        puts line
      end

      exit_status = wait_thr.value #remove pid from exit status
      # code = $?.exitstatus
      puts "Exit code: #{exitstatus}"
      unless exit_status.success?
        abort "FAILED !!!"
      end
    end

    #e = Error new(exit_status, message)

  end
end
