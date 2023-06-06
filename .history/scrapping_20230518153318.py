from bs4 import BeautifulSoup
from bs4.element import Comment
import urllib.request


def tag_visible(element):
    if element.parent.name in ['style', 'script', 'head', 'title', 'meta', '[document]']:
        return False
    if isinstance(element, Comment):
        return False
    return True


def text_from_html(body):
    soup = BeautifulSoup(body, 'html.parser')
    texts = soup.findAll(text=True)
    visible_texts = filter(tag_visible, texts)
    return u" ".join(t.strip() for t in visible_texts)

html = urllib.request.urlopen('https://www.nytimes.com/').read()
text = text_from_html(html)
print(text_from_html(html))


file_path = "output.txt"

# Open the file in write mode and write the text content
with open(file_path, "w") as file:
    file.write(text)

print("Variable content saved to the file:", file_path)