CONFIG = {}

module Config
  def Config.check_github_env_vars
    if !ENV['GITHUB_USERNAME'] || !['GITHUB_PASSWORD']
      puts 'WARN: GITHUB_USERNAME or GITHUB_PASSWORD aren\'t set. This will result in a very low rate limit'
    end
    if !ENV['DRONE_GH_SERVER']
      puts 'DRONE_GH_SERVER must be set'
      exit
    end
    if !ENV['GITHUB_SERVER']
      puts 'GITHUB_SERVER not set, defaulting to public Github'
    end
  end

  def Config.check_gitlab_env_vars
    if !ENV['DRONE_GL_SERVER'] || !ENV['DRONE_GL_TOKEN'] || !ENV['GITLAB_SERVER'] || !ENV['GITLAB_TOKEN']
      puts 'DRONE_GL_SERVER, DRONE_GL_TOKEN, GITLAB_SERVER, and GITLAB_TOKEN must all be set to display entries for Gitlab'
      exit
    end
  end

  def Config.set_github_config
    CONFIG[:github_repos] = (ENV['GITHUB_REPOS'] || '').split(',')
    CONFIG[:github_login] = ENV['GITHUB_USERNAME']
    CONFIG[:github_password] = ENV['GITHUB_PASSWORD']
    CONFIG[:drone_github_server] = ENV['DRONE_GH_SERVER']
    CONFIG[:github_server] = ENV['GITHUB_SERVER'] || 'https://api.github.com'
  end

  def Config.set_gitlab_config
    CONFIG[:gitlab_repos] = (ENV['GITLAB_REPOS'] || '').split(',')
    CONFIG[:drone_gitlab_server] = ENV['DRONE_GL_SERVER']
    CONFIG[:drone_gitlab_token] = ENV['DRONE_GL_TOKEN']
    CONFIG[:gitlab_server] = (ENV['GITLAB_SERVER'] || '') + '/api/v3'
    CONFIG[:gitlab_token] = ENV['GITLAB_TOKEN']
  end
end

if ENV['GITHUB_REPOS']
  Config.check_github_env_vars
  Config.set_github_config
else
  puts 'No GITHUB_REPOS specified, not fetching data from Github'
end

if ENV['GITLAB_REPOS']
  Config.check_gitlab_env_vars
  Config.set_gitlab_config
else
  puts 'No GITLAB_REPOS specified, not fetching data from Gitlab'
end