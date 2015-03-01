from flask import Flask
try:
    from flask.ext.cors import CORS  # The typical way to import flask-cors
except ImportError:
    # Path hack allows examples to be run without installation.
    import os
    parentdir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    os.sys.path.insert(0, parentdir)
    from flask.ext.cors import CORS

import json

app = Flask(__name__)
cors = CORS(app)

print "new app!"
rating_sum = 0
count = 0

def get_avg_rating(a_rating):
    global rating_sum, count
    print rating_sum, count, a_rating

    a_rating = int(a_rating)
    status = "Thanks for you rating"
    if  a_rating < 0 or a_rating > 5:
        status = "Oops.. something goes wrong"
    rating_sum += a_rating
    count += 1
    avg_rating = rating_sum * 1.0 / count
    return avg_rating, count, status

@app.route("/<name>")
def hello(name):
    rate_and_count = get_avg_rating(name)
    print "hello"
    rate = rate_and_count[0]
    count = rate_and_count[1]
    info = rate_and_count[2]
    print rate, count
    
    data = {'name':name, 'info': info, 'rate':rate, 'count':count}
    return json.dumps(data)

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug = False)


    
    
