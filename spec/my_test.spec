# Simple tests
require 'dockerspec/serverspec'
require 'dockerspec/infrataster'


describe 'multibuild php test' do
  describe docker_build('.') do
    # [...]
    describe docker_run(described_image) do
      describe server(described_container) do # Infrataster

        describe http('/') do
          it 'responds content including "PHP"' do
            expect(response.body).to include 'php'
          end

          it 'responds as "php" server' do
            expect(response.headers['server']).to match(/php/i)
          end
        end

      end
    end
  end
end
