require 'json'

class InvalidConfig < ArgumentError
end

class ConfigFile
  def initialize(name)
    file = File.read(name)
    @config = JSON.parse(file)

    @config["aws"] ||= {}
    @config["cdns"] ||= {}

    # require some values or die
    @config["upload"]["dir"] rescue raise InvalidConfig.new("Missing config['upload']['dir']")
    @config["bucket"]["name"] rescue raise InvalidConfig.new("Missing config['bucket']['name']")
  end


  def upload_dir
    if dir = @config["upload"]["dir"]
      return "#{project_path}/#{dir}"
    end
  end

  def aws_account
    @config["aws"]["account"]
  end

  def aws_keyfile
    @config["aws"]["keyfile"]
  end

  def bucket_name
    @config["bucket"]["name"]
  end

  def bucket_path
    if path = @config["bucket"]["path"]
      # Git Repo
      git_tag  = `git describe --abbrev=0 --tags 2>/dev/null`
      git_tag.gsub!("\n", "")
      git_tag  = git_tag != "" ? git_tag : "v0.0.0"
      git_sha1 = `git rev-parse HEAD | head -c 8`

      path_template = path.dup

      path_template.gsub!("$git_tag", git_tag)
      path_template.gsub!("$git_sha1", git_sha1)

      return path_template
    else
      return "/"
    end
  end

  def bucket_options
    @config["bucket"]["options"]
  end

  def cdns
    @config["cdns"]
  end


  # ----------------------------------


  # def s3_sync_flags
  #   @config["s3-opts"] || ""
  # end

  # def bucket
  #   @config["bucket"]
  # end

  # def deploy_path
  #   # Git Repo
  #   git_tag  = `git describe --abbrev=0 --tags 2>/dev/null`
  #   git_tag  = git_tag != "" ? git_tag : "v0.0.0"
  #   git_sha1 = `git rev-parse HEAD | head -c 8`

  #   path_template = @config["path"].dup

  #   path_template.gsub!("$git_tag", git_tag)
  #   path_template.gsub!("$git_sha1", git_sha1)

  #   return path_template
  # end

  # def build_dir
  #   return "#{project_path}/#{@config["build-dir"]}"
  # end

  private

  def project_path
    `git rev-parse --show-toplevel`.tr("\n", '')
  end
end

