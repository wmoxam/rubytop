require 'curses'
require 'pry'

trap("SIGINT") { exit(0) }

class Rubytop
  HEIGHT = 55
  WIDTH = 120
  SLEEP_TIME = 2

  def initialize
    @process_id = get_process_id.to_i

    raise "Can't find jruby process id" if @process_id == 0

    @start_objects = {}
    @prev_objects = {}
    @current_objects = {}

    Curses.init_screen()
    @window = Curses::Window.new(HEIGHT, WIDTH, 0, 0)
    @header = @window.subwin(2, WIDTH, 0, 0)
    @class_name = @window.subwin(HEIGHT - 2, 60, 2, 0)
    @instances = @window.subwin(HEIGHT - 2, 7, 2, 60)
    @instances_delta = @window.subwin(HEIGHT - 2, 7, 2, 67)
    @bytes = @window.subwin(HEIGHT - 2, 13, 2, 74)
    @bytes_delta = @window.subwin(HEIGHT - 2, 13, 2, 87)
    @start_instances_delta = @window.subwin(HEIGHT - 2, 7, 2, 100)
    @start_bytes_delta = @window.subwin(HEIGHT - 2, 13, 2, 107)
  end

  def get_process_id
    `jps -l | grep jruby`.split(/\n/).first.to_s.split(/\s/).first.to_s.chomp
  end

  def header(i)
    @header.clear
    @header << " Name  #{i}                                                    ints   idelt   bytes       bytes del   sidelt sbytes del\n"
    @header << "-----------------------------------------------------------------------------------------------------------------------"
    @header.refresh
  end

  def fetch_jmap_info!
    @start_objects = @current_objects.dup if @start_objects.keys.empty?
    @prev_objects = @current_objects.dup
    @current_objects = {}

    i = 0
    `jmap -histo:live #{@process_id} | grep uby`.each_line do |line|
      num, instances, bytes, class_name = line.strip.split(/\s+/)
      prev_object = @prev_objects[class_name] || {}
      start_object = @start_objects[class_name] || {}

      @current_objects[class_name] = { instances: instances,
                                       bytes: bytes,
                                       instances_delta: instances.to_i - prev_object[:instances].to_i,
                                       start_instances_delta: instances.to_i - start_object[:instances].to_i,
                                       bytes_delta: bytes.to_i - prev_object[:bytes].to_i,
                                       start_bytes_delta: bytes.to_i - start_object[:bytes].to_i }
    end
  end

  def run
    i = 0
    while true do
      i += 1
      i = 0 if i > 9
      header(i)
      fetch_jmap_info!
      display!
      @window.refresh
      sleep SLEEP_TIME
    end
  end

  def display!
    [@class_name, @instances, @instances_delta, @bytes, @bytes_delta, @start_instances_delta, @start_bytes_delta].each {|w| w.clear }

    i = 0
    @current_objects.each_pair do |class_name, values|
      i += 1
      next if i > 46
      @class_name << class_name.to_s.slice(0,59) + "\n"
      @instances << values[:instances].to_s + "\n"
      @instances_delta << values[:instances_delta].to_s + "\n"
      @bytes << values[:bytes].to_s + "\n"
      @bytes_delta << values[:bytes_delta].to_s + "\n"
      @start_instances_delta << values[:start_instances_delta].to_s + "\n"
      @start_bytes_delta << values[:start_bytes_delta].to_s + "\n"
    end

    [@class_name, @instances, @instances_delta, @bytes, @bytes_delta, @start_instances_delta, @start_bytes_delta].each {|w| w.refresh }
  end
end
