Pod::Spec.new do |spec|
spec.name = "LYTopWindow"
spec.version = "1.0.2"
spec.summary = "一行代码集成点击状态栏时，当前window上ScrollView滚动到顶部。"
spec.homepage = "https://github.com/CoderYLiu/LYTopWindow"
spec.license = { type: 'MIT', file: 'LICENSE' }
spec.authors = { "CoderYLiu" => 'coderyliu@gmail.com' }
spec.social_media_url = "http://www.jianshu.com/users/455a0339b2c3/latest_articles"

spec.platform = :ios, "7.0"
spec.requires_arc = true
spec.source = { git: "https://github.com/CoderYLiu/LYTopWindow.git", tag: "1.0.2", submodules: true }
spec.source_files = "LYTopWindow/LYTopWindowExample/LYTopWindow/*.{h,m}"

end
