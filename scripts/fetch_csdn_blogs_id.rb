ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'rails'
require 'rubygems'

url = "https://blog.csdn.net/community/home-api/v1/get-business-list?page=1&size=20&businessType=blog&orderby=&noMore=false&year=&month=&username=m0_67038390"
Rails.logger.info "===#{url}"
headers = {
  'Host': 'blog.csdn.net',
  'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:101.0) Gecko/20100101 Firefox/101.0',
  'Accept': "application/json, text/plain, */*",
  'Accept-Language': 'zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2',
  'Referer': "https://blog.csdn.net/m0_67038390?type=blog",
  'Connection': 'keep-alive',
  'Cookie': 'uuid_tt_dd=10_30868915010-1647218359544-888094; log_Id_pv=3058; Hm_lvt_6bcd52f51e9b3dce32bec4a3997715ac=1653353282,1653439201,1653877602,1654320042; Hm_up_6bcd52f51e9b3dce32bec4a3997715ac=%7B%22islogin%22%3A%7B%22value%22%3A%221%22%2C%22scope%22%3A1%7D%2C%22isonline%22%3A%7B%22value%22%3A%221%22%2C%22scope%22%3A1%7D%2C%22isvip%22%3A%7B%22value%22%3A%220%22%2C%22scope%22%3A1%7D%2C%22uid_%22%3A%7B%22value%22%3A%22m0_67038390%22%2C%22scope%22%3A1%7D%7D; Hm_ct_6bcd52f51e9b3dce32bec4a3997715ac=6525*1*10_30868915010-1647218359544-888094!5744*1*m0_67038390; log_Id_view=10086; __gads=ID=711ab19772db56df-227e16c0f6d0007d:T=1647218362:RT=1647218362:S=ALNI_MZVONgSb2fgOA4np-KWaHp_zZE2Ig; ssxmod_itna=QqROGKYIxGg7G=DXWRelDUxYuKWqh5Dtq+Qb1bzDlpCYxA5D8D6DQeGTbn5IbeOGBhrIaq57h0KK677fpYNkFrD+Aak38PpeDQxY=DUxAtDBxDmR+GDBdQbeoxibhxi5GRD0KDWDYPGWtqDmDGAuDBYDmqG0DDtO/4G2D7UaAqXligDjzxQRiT69zMeItODNbYqT9GmBi7DFoYhPji+Tb0FDG8qCXaD=; ssxmod_itna2=QqROGKYIxGg7G=DXWRelDUxYuKWqh5Dtq+Qb1D6p3bD0HRh7K03H5n6UD6BrXv7q6qlbmBH58ke2MuNN5ZBEYb8iE4nvQH4yo8Ye7V+U2a=6XFbq4eLoBZPRGhX9hd2gRQA1tqQCzn9xq0aWu6pTqBw5pp0zcjai97PhtgAaTonhT6yr7m4Dw2GdDjKD+2GDD===; log_Id_click=2071; UserName=m0_67038390; UserInfo=6390f0296b454c848b15dad9af491c8f; UserToken=6390f0296b454c848b15dad9af491c8f; UserNick=%E8%AE%B8%E5%A2%A8%E3%81%AE%E5%B0%8F%E8%9D%B4%E8%9D%B6; AU=0C0; UN=m0_67038390; BT=1647226008368; p_uid=U010000; c_dl_prid=1654046937327_425722; c_dl_rid=1654330829905_512271; c_dl_fref=https://mall.csdn.net/myorder; c_dl_fpage=/list/download; c_dl_um=-; _ga=GA1.2.370972879.1647250372; Hm_lvt_e5ef47b9f471504959267fd614d579cd=1654581720; __gpi=UID=000004a193679d90:T=1649411929:RT=1654566407:S=ALNI_MaVL1yVnNYBkdeG_p9xWdQ7ZdJUug; web-pro-guid=de2a246ee3c911ec8f8e00163e11c821; web-pro-token=ddf80164e3c911ecb12700163e11c821; web-pro-phone=17857570636; web-pro-csdnid=m0_67038390; c_pref=default; c_ref=default; c_first_ref=default; c_first_page=https%3A//blog.csdn.net/m0_67038390%3Ftype%3Dblog; c_segment=14; Hm_lpvt_6bcd52f51e9b3dce32bec4a3997715ac=1654584593; dc_sid=8f968b1627b8a4c1b959beb5765507d6; csrfToken=uPjHuOd7UIXNj7SQbOWTAdE6; x_dev_cloud_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjcmVkZW50aWFsIjoiIiwiY3NkblVzZXJuYW1lIjoibTBfNjcwMzgzOTAiLCJ1c2VySWQiOiI2Mjk1NzMxMzlkMGMwYTIxNzBiNmZiYmYiLCJ1c2VybmFtZSI6Im0wXzY3MDM4MzkwIn0.vd0ReW9N3c2g16uwzuNnfv23PAq8mbNxzsxSbV5_ZpM; _gid=GA1.2.1862831546.1654480963; dc_tos=rd3hn4; dc_session_id=10_1654581333079.859238; c_dsid=11_1654581389066.271213; FCNEC=[["AKsRol9Ao4hhZ_mVGx0sGFFlGsw9SQhesGKev7HdS4vFP5KUVWVXJYoH6InAJ7dSkYNrykanDWDQ7PAEFHUqtstkuOUErknxaLhRynlRbSE-BuV96ZYan6mBHHx-NatR9nDlCxA6-r1OF2wRWLNpmhccKXweO5t7_Q=="],null,[]]; Hm_lpvt_e5ef47b9f471504959267fd614d579cd=1654583169; c_utm_medium=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1-123763200-blog-114710332.nonecase; c_utm_relevant_index=1; _gat_gtag_UA_127895514_2=1; c_page_id=default',
  'Sec-Fetch-Dest': 'empty',
  'Sec-Fetch-Mode': 'cors',
  'Sec-Fetch-Site': 'same-origin',
  'TE': 'trailers'
}

http = Net::HTTP.new(url.host, url.port)
Rails.logger.info "====http is #{http.inspect}=====, url: #{url}====="
http.use_ssl = true
request = Net::HTTP::Get.new(url, headers)
response = http.request(request)
body = JSON.parse(response.body)
Rails.logger.info "==============body is #{body}"
