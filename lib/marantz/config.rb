module Marantz
  extend self
  VOLUME_THRESHOLD = 80.0
  COMMANDS = {
    volume: 'PutMasterVolumeSet/-%s',
    source: 'PutZone_InputFunction/%s',
    power: 'PutZone_OnOff/%s',
    mute: 'PutVolumeMute/%s'
  }
  PATHS = {
    main_zone: '/MainZone/index.put.asp',
    status: '/goform/formMainZone_MainZoneXml.xml'
  }
  SOURCES = {
    satellite: 'SAT/CBL',
    iradio: 'IRADIO',
    spotify: 'SPOTIFY'
  }
  SUPPORTED_MODELS = {
    8=> 'NR1607'
  }

  def configure(&block)
    yield @config ||= Configuration.new
  end

  def config
    @config
  end

  class Configuration
    attr_accessor :host, :max_volume
  end

  configure do |config|
    config.host = '10.0.0.22'
    config.max_volume = 90.0
  end
end
