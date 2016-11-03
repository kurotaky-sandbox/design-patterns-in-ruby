class SlickButton
  attr_accessor :command

  def initialize(command)
    @command = command
  end

  # ボタン描画と管理のためのコード
  # コードは省略...

  def on_button_push
    @command.execute if @command
  end
end

class SaveCommand
  def execute
    # 現在の文書を保存...
  end
end

class SaveButton < SlickButton
  def on_button_push
    # 現在の文章を保存...
  end
end

class NewDocumentButton < SlickButton
  def on_button_push
    # 新しい文書を作成...
  end
end

save_button = SlickButton.new( SaveCommand.new )
