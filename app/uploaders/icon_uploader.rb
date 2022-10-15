class IconUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # アップローダーでどんな種類のものを受け取るか指定
  storage :file

  #上限変更
  process :resize_to_limit => [700, 700]

  #JPGで保存
  process :convert => 'jpg'

  #サムネイルを生成
  version :thumb do
    process :resize_to_fill => [150, 150, "center"]
  end

  version :thumb100 do  #アイコン用
    process resize_to_fill: [100, 100, "center"]
   end 

  # jpg,jpeg,gif,pngのみ
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  #ファイル名を変更し拡張子を同じにする
  def filename
    super.chomp(File.extname(super)) + '.jpg' 
  end

  #日付で保存
  def filename
    if original_filename.present?
      time = Time.now
      name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
      name.downcase
    end
  end

  #アップロードした画像の表示
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #デフォルト画像の設定
  def default_url
    "default.png" #デフォルト画像に設定したい画像名を記入
  end
end
