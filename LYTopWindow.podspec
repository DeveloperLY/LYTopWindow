Pod::Spec.new do |spec|
spec.name = "LYTopWindow"
spec.version = "1.0.4"
spec.summary = "一行代码集成点击状态栏时，当前window上ScrollView滚动到顶部。"
spec.homepage = "https://github.com/DeveloperLY/LYTopWindow"
spec.license = { type: 'Apache License 2.0', file: 'LICENSE' }
spec.authors = { "DeveloperLY" => 'coderyliu@gmail.com' }

spec.platform = :ios, "8.0"

spec.requires_arc = true

spec.source = { git: "https://github.com/DeveloperLY/LYTopWindow.git", tag: '1.0.4'}

spec.source_files = "LYTopWindow/**/*.{h,m}"

end
