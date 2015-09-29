require 'json'

class ConfigFile
  def initialize(name)
    puts `pwd`
    file = File.read(name)
    @config = JSON.parse(file)
  end

  def s3_sync_flags
    @config["s3-opts"] || ""
  end

  def bucket
    @config["bucket"]
  end

  def deploy_path
    # Git Repo
    git_tag  = `git describe --abbrev=0 --tags 2>/dev/null`
    git_tag  = git_tag != "" ? git_tag : "v0.0.0"
    git_sha1 = `git rev-parse HEAD | head -c 8`

    path_template = @config["path"].dup

    path_template.gsub!("$git_tag", git_tag)
    path_template.gsub!("$git_sha1", git_sha1)

    return path_template
  end

  def cdns
    @config["cdns"]
  end

  def build_dir
    return "#{project_path}/#{@config["build-dir"]}"
  end

  private

  def project_path
    `git rev-parse --show-toplevel`.tr("\n", '')
  end
end

