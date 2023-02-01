library("rvest")
url = "https://www.imdb.com/chart/moviemeter/"
webpage = read_html(url)
runtime_data = html_nodes(webpage,'strong')
runtime_data = html_text(runtime_data)
print(runtime_data)
# runtime_data = gsub(" min",runtime_data)
runtime_data = as.numeric(runtime_data)
print(runtime_data)