
# frozen_string_literal: true

RSpec.describe 'main.rb' do
  let(:executable_path) { File.expand_path('lib/main.rb') }

  before { allow_any_instance_of(IO).to receive(:gets).and_return(stdin) }

  context 'with celsius' do
    let(:stdin) { '36c' }
    let(:stdout) { "Input (°C, °F or °K)\n°F: 96.8\n°K: 309\n" }

    it 'returns expected string' do
      expect { load(executable_path) }.to output(a_string_including(stdout)).to_stdout
    end
  end

  xcontext 'with fahrenheit' do
    let(:stdin) { '32f' }
    let(:stdout) { "Input (°C, °F or °K)\n°C: 0\n°K: 273\n" }

    it 'returns expected string' do
      expect { load(executable_path) }.to output(a_string_including(stdout)).to_stdout
    end
  end

  xcontext 'with kelvin' do
    let(:stdin) { '273k' }
    let(:stdout) { "Input (°C, °F or °K)\n°C: 0\n°F: 32\n" }

    it 'returns expected string' do
      expect { load(executable_path) }.to output(a_string_including(stdout)).to_stdout
    end
  end

  context 'with unprocessable sign' do
    let(:stdin) { '36d' }
    let(:stdout) { "Wrong temperature sign: `d`\n" }

    it 'returns expected string' do
      expect { load(executable_path) }.to output(a_string_including(stdout)).to_stdout
    end
  end

  context 'with wrong input' do
    let(:stdin) { '3' }
    let(:stdout) { "Wrong input: `3`\n" }

    it 'returns expected string' do
      expect { load(executable_path) }.to output(a_string_including(stdout)).to_stdout
    end
  end

end
