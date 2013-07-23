# -*- coding: utf-8 -*-


# Get the stock information 

require 'net/http'
require 'yaml'
require 'rubygems'
require 'ruby-debug'
class Stock
  STOCK_URI = "http://hq.sinajs.cn/list=%s"
  # var hq_str_sh601006="大秦铁路, 27.55, 27.25, 26.91, 27.55, 26.20, 26.91, 26.92,
  # 22114263, 589824680, 4695, 26.91, 57590, 26.90, 14700, 26.89, 14300,
  #  26.88, 15100, 26.87, 3100, 26.92, 8900, 26.93, 14230, 26.94, 25150, 26.95, 15220, 26.96, 2008-01-11, 15:05:32";
  # 这个字符串由许多数据拼接在一起，不同含义的数据用逗号隔开了，按照程序员的思路，顺序号从0开始。

  # 0：”大秦铁路”，股票名字；
  # 1：”27.55″，今日开盘价；
  # 2：”27.25″，昨日收盘价；
  # 3：”26.91″，当前价格；
  # 4：”27.55″，今日最高价；
  # 5：”26.20″，今日最低价；
  # 6：”26.91″，竞买价，即“买一”报价；
  # 7：”26.92″，竞卖价，即“卖一”报价；
  # 8：”22114263″，成交的股票数，由于股票交易以一百股为基本单位，所以在使用时，通常把该值除以一百；
  # 9：”589824680″，成交金额，单位为“元”，为了一目了然，通常以“万元”为成交金额的单位，所以通常把该值除以一万；
  # 10：”4695″，“买一”申请4695股，即47手；
  # 11：”26.91″，“买一”报价；
  # 12：”57590″，“买二”
  # 13：”26.90″，“买二”
  # 14：”14700″，“买三”
  # 15：”26.89″，“买三”
  # 16：”14300″，“买四”
  # 17：”26.88″，“买四”
  # 18：”15100″，“买五”
  # 19：”26.87″，“买五”
  # 20：”3100″，“卖一”申报3100股，即31手；
  # 21：”26.92″，“卖一”报价
  # (22, 23), (24, 25), (26,27), (28, 29)分别为“卖二”至“卖四的情况”
  # 30：”2008-01-11″，日期；
  # 31：”15:05:32″，时间；

  def initialize(stock_no)
    url = STOCK_URI % stock_no
    result = Net::HTTP::get_response(URI.parse(url)).body
    result = result.split("=")[1].split(",")
    @id = stock_no
    @name = result[0].to_s.encode(Encoding.find("UTF-8"),Encoding.find("GBK"))
    @price = result[3].to_f
    inc = (@price - result[2].to_f) * 100 /result[1].to_f
    @inc = "%.2f" % inc
  end

  def display
    "#{@id} #{@name} #{@price} #{@inc}"
  end
end

STOCK_CONF = 'stocks.yml'

def help
  puts "Get the stock information:\nUsage:"
  puts "ruby #{__FILE__}\t\tWhen the stocks are in stock.yml"
  puts "ruby #{__FILE__} <stock_id[,<stock_id>,...]>\t\tWhen the stocks provided in the command line"
  exit 0
end

# Read the data from configuration file if no argument provide
help if ARGV.length > 1

if ARGV.empty?
  ids = YAML.load_file(STOCK_CONF).split
else ARGV.length == 1
  ids = ARGV[0].split(",")
end

ids.each {|id| puts Stock.new(id).display}
