# Simple tests
require 'dockerspec/serverspec'
require 'dockerspec/infrataster'


describe 'multibuild php test' do
  docker_env = { 'SSH_PORT' => '22' }

  describe docker_build(
  template: 'Dockerfile1.erb', context: { 'phpversion' => ENV['PHP_VERSION']}
  ) do
    it { should have_expose '80', env: docker_env }


  end
end
