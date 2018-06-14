import requests
import re
from bs4 import BeautifulSoup

def get_movies(url):
    """ gets the list of films remember type should be movie, not episodes,series
    """
    html = requests.get(url).text
    films = re.findall(r'href="/title/(.*)"\n>(.*)</a>', html)
    return films

def get_person(url):
    html = requests.get(url).text
    soup = BeautifulSoup(html, 'html.parser')
    tag = str(soup.find_all('script', {"type":"application/ld+json"}))
    n = re.findall(r'  "name": "(.*)"', tag)
    name = n[0] if n else "NULL"
    n = re.findall(r' "image": "(.*)"', tag)
    img = n[0] if n else "NULL"
    n = re.findall(r' "description": "(.*)"', tag)
    bio = n[0].replace("\\u0027","'")
    n = re.findall(r' "birthDate": "(.*)"', tag)
    birth = n[0] if n else "NULL"
    return {"name": name, "img_url": img, "bio": bio, "birth_date":birth}

def find_cast(tags):
    ret = []
    c = 0
    for tag in tags:
        chs = re.findall(r'<a href="(.*)" itemprop="url"> <span class="itemprop" itemprop="name">(.*)</span>',str(tag))
        ret.append(get_person("https://www.imdb.com"+chs[0][0]))
        c+=1
        if c == 9: break
    return ret

def get_details(url, title):
    """ gets the details of page, returns dict
    remember adding imdb.com domain"""
    html = requests.get(url).text
    soup = BeautifulSoup(html, 'html.parser')
    d = {}
    d["title"] = title
    d["img_url"] = str(re.findall(r'src="(.*)"', str(soup.find_all('div', class_="poster")[0]))[0].split('"')[0])
    d["genres"] = re.findall(r'<span class="itemprop" itemprop="genre">(.*)</span>', html)
    d["cast"] = find_cast(soup.find_all('tr', class_="odd"))
    d["cast"].extend(find_cast(soup.find_all('tr', class_="even")))
    d["date_of_release"] = re.findall(r'<meta itemprop="datePublished" content="(.*)" />', html)[0]
    # send data to server in json
#get_details("https://www.imdb.com/title/tt5463162/?ref_=adv_li_tt", "Deadpool 2")

def bot():
    count_ = 10000
    main_url = "https://www.imdb.com/search/title?genres=comedy&explore=title_type,genres&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=75c37eae-37a7-4027-a7ca-3fd76067dd90&pf_rd_r=QJ09M77KEC4S0JZZTQ0M&pf_rd_s=center-1&pf_rd_t=15051&pf_rd_i=genre&title_type=tvMovie"
    next_num = 2
    films = get_movies("https://www.imdb.com/search/title?genres=comedy&explore=title_type,genres&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=75c37eae-37a7-4027-a7ca-3fd76067dd90&pf_rd_r=QJ09M77KEC4S0JZZTQ0M&pf_rd_s=center-1&pf_rd_t=15051&pf_rd_i=genre&title_type=tvMovie&ref_=adv_explore_rhs")
    while count_:
        if not films:
            murl = main_url + "page=" + str(next_num) + "&ref_=adv_nxt"
            next_num += 1
            films = get_movies(murl)
        if count_ and not films:
            raise ValueError("No Movie Found")
        while count_ and films:
            url, title = films.pop()
            count_ -= 1
            print("https://www.imdb.com/title/"+url)
            get_details("https://www.imdb.com/title/"+url,title)
            print(count_)
bot()
