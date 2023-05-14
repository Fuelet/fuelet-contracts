release_tag_name = 'fuelet_contracts-v1.7.0' # generated; do not edit

# We cannot distribute the XCFramework alongside the library directly,
# so we have to fetch the correct version here.
framework_name = 'FlutterFueletContracts.xcframework'
remote_zip_name = "#{framework_name}.zip"
url = "https://github.com/Fuelet/fuelet-contracts/releases/download/#{release_tag_name}/#{remote_zip_name}"
local_zip_name = "#{release_tag_name}.zip"
`
cd Frameworks
rm -rf #{framework_name}

if [ ! -f #{local_zip_name} ]
then
  curl -L #{url} -o #{local_zip_name}
fi

unzip #{local_zip_name}
cd -
`

Pod::Spec.new do |spec|
  spec.name          = 'flutter_fuelet_contracts'
  spec.version       = '1.0.0'
  spec.license       = { :file => '../LICENSE' }
  spec.homepage      = 'https://github.com/Fuelet/fuelet-contracts'
  spec.authors       = { 'Mikhail Poplavkov' => 'mihail.poplavkov@gmail.com' }
  spec.summary       = 'iOS/macOS Flutter bindings for flutter_fuelet_contracts'

  spec.source              = { :path => '.' }
  spec.source_files        = 'Classes/**/*'
  spec.public_header_files = 'Classes/**/*.h'
  spec.vendored_frameworks = "Frameworks/#{framework_name}"

  spec.ios.deployment_target = '11.0'
  spec.osx.deployment_target = '10.11'
end
