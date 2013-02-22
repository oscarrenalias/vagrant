require 'erb'

#
# TODO: put this in some reusable file?
#
class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def pink
    colorize(35)
  end
end

desc "Initializes all modules"
task :bootstrap do |t|
  puts "Initializing top-level git submodules... ".green
  system "git submodule init && git submodule update"

  # all modules also have submodules, so they need to be initialized
  Dir.glob("*") do |d|
    if File.directory?(d)
      if File.exists?("#{d}/Vagrantfile") && File.exists?("#{d}/modules")
        # It's a vagrant template
        puts "Initializing modules for VM #{d}".green
        system "cd #{d}/modules && git submodule init && git submodule update"
      end 
    end
  end 

  puts "Done".green
end

desc "Creates new Vagrant VM definition"
task :new_vm, [:name] do |t, args|
  name = args.name

  if name == nil
    fail "Please provide a name for the new Vagrant VM".red
  end

  # check that the Vagrant VM doesn't already exist
  if File.exists? "./#{name}"
    fail "Vagrant VM #{name} already exists, aborting".red
  end  

  # create the folder structure
  print "Creating folder structure... "
  folders = [ "#{name}", "#{name}/manifests" ]
  folders.each do |f|
      FileUtils.mkdir(f)
  end
  puts "Done".green

  # Use all .erb files present in the templates/ folder to initialize basic manifests. If we ever need
  # more default manifests, we can simply drop another .erb file in the folder
  print "Generating default manifests... "

  # generate a random ip address    
  vm_ip = "192.168.33.#{(rand(254)+1).to_s}"

  [{:source => "init.pp.erb", :target=>"manifests/init.pp"}, {:source=>"Vagrantfile.erb", :target=>"Vagrantfile"}].each do |template|
    template_file = "templates/#{template[:source]}"
    target_file = template[:target]

    # process the ERB template and write it out to the manifest file
    erb = ERB.new(File.read(template_file))
    File.open("#{name}/#{target_file}", "w+") { |f| f << erb.result(binding) }
  end
  puts "Done".green  

  # set up the git submodule
  print "Setting up git submodule..."
  system("git submodule add https://github.com/oscarrenalias/puppet.git #{name}/modules")
  puts "Done".green
  puts "IP address of the new host is #{vm_ip}".green

end