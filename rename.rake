namespace 'rails' do
      desc 'Renames a rails 3 application'
        task :rename, :new_name do |t, args|
            files = ['app/views/layouts/application.html.erb', 'config.ru', 'config/environment.rb', 'config/routes.rb', 'config/application.rb', 'config/environments/development.rb','config/environments/test.rb','config/environments/production.rb']
            old_name = File.read('config.ru')[/run (.*)::Application/,1]
            files.each do |file|
                text = File.read(file)
                File.open(file, "w") do |raw|
                    raw.puts text.gsub(old_name, args[:new_name])
                end
            end
        end
end
