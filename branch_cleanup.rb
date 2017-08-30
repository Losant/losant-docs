#!/usr/bin/env ruby

def handle_return(command)
  exit_status = system(command)
  unless exit_status
    puts "ERROR RUNNING COMMAND"
    exit(1)
  end
end

handle_return("git checkout master")
handle_return("git pull")
handle_return("git remote prune origin")

`git branch -r --merged`.each_line do |branch|
  branch = branch.strip.gsub("origin/", "")
  next if branch =~ /^HEAD ->/
  next if branch == "master"
  next if branch == "release"
  next if branch == "develop"
  handle_return("grb delete #{branch}")
end
