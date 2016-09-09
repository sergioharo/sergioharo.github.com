require "rubygems"
require "bundler/setup"
require "yaml"

Bundler.require

# Change your GitHub reponame
GITHUB_REPONAME = "sergioharo/sergioharo.github.com"
GITHUB_MASTER_FOLDER = File.join(Dir.home(), "/Sites/sergioharo.github.com")

desc "Generate blog files"
task :generate do
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "_site"
  })).process
end

desc "Generate and publish blog to github"
task :publish => [:generate] do
  Dir.chdir GITHUB_MASTER_FOLDER do
    system "git checkout master"
    system "git pull"
  end

  cp_r "_site/.", GITHUB_MASTER_FOLDER

  Dir.chdir GITHUB_MASTER_FOLDER do
    message = "Site updated at #{Time.now.utc}"
    system "git add ."
    system "git commit -m #{message.shellescape}"
    system "git push origin master"
  end
end