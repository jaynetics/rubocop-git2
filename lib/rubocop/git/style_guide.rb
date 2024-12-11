# ref. https://github.com/thoughtbot/hound/blob/d2f3933/app/models/style_guide.rb
class RuboCop::Git::StyleGuide
  def initialize(rubocop_options, config_file, custom_config = nil)
    @rubocop_options = rubocop_options
    @config_file = config_file
    @custom_config = custom_config
  end

  def violations(file)
    if ignored_file?(file)
      []
    else
      src = process_source(file)
      team = RuboCop::Cop::Team.mobilize(enabled_cops, config, rubocop_options)
      team.respond_to?(:investigate) ? team.investigate(src).offenses : team.inspect_file(src)
    end
  end

  def inspect
    "#<#{self.class.name}>"
  end

  private

  def enabled_cops
    registry.enabled(config)
  end

  def registry
    @registry ||= begin
      cops = RuboCop::Cop::Registry.all
      if (only = rubocop_options[:only])
        cops = cops.select { |c| c.match?(only) }
      end
      RuboCop::Cop::Registry.new(cops, rubocop_options)
    end
  end

  def ignored_file?(file)
    !included_file?(file) || file.removed? || excluded_file?(file)
  end

  def included_file?(file)
    config.file_to_include?(file.absolute_path)
  end

  def excluded_file?(file)
    config.file_to_exclude?(file.absolute_path)
  end

  def process_source(file)
    source = RuboCop::ProcessedSource.new(
      file.content,
      config.target_ruby_version,
      file.absolute_path
    )
    source.config = config
    source.registry = registry
    source
  end

  def config
    @config ||= begin
      config = RuboCop::ConfigLoader.configuration_from_file(@config_file)
      combined_config = RuboCop::ConfigLoader.merge(config, override_config)
      RuboCop::Config.new(combined_config, "")
    end
  end

  def rubocop_options
    if config["ShowCopNames"]
      { debug: true }
    else
      {}
    end.merge(@rubocop_options)
  end

  def override_config
    if @custom_config
      config_content = RuboCop::Config.load_yaml_configuration(@custom_config)
      override_config = RuboCop::Config.new(config_content, "")
      override_config.add_missing_namespaces
      override_config.make_excludes_absolute
      override_config
    else
      {}
    end
  end
end
