# frozen_string_literal: true
# @see https://qiita.com/minamijoyo/items/9653af0b737da87b91c6

# TODO moduleで動くかすようにする。
class Credentials < Thor
  desc 'encrypt', 'encrypt develpment.local.yml'
  def encrypt
    system ['yaml_vault', 'encrypt', raw_filename, '-o', encrypted_filename].join(' ')
  end

  desc 'decrypt', 'decrypt develpment.local.encrypted.yml'
  def decrypt
    system ['yaml_vault', 'decrypt', encrypted_filename, '-o', raw_filename].join(' ')
  end

  private

  def base_dir
    'config/settings'
  end

  def raw_filename
    File.join(base_dir, 'development.local.yml')
  end

  def encrypted_filename
    File.join(base_dir, 'development.local.encrypted.yml')
  end
end
