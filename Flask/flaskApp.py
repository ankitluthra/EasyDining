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
rating_sum = {"isr":[0,0], "far":[0,0], "par":[0,0], "ba":[0,0], "ikb":[0,0]}
status = "Thanks for your rating"

def get_avg_rating(location, a_rating):
    global rating_sum, status
    print rating_sum, a_rating

    a_rating = int(a_rating)
    if  a_rating < 0 or a_rating > 5:
        status = "Oops.. something goes wrong"
    rating_sum[location][0] += a_rating
    rating_sum[location][1] += 1
    avg_rating = rating_sum[location][0] * 1.0/ rating_sum[location][1]
    return avg_rating

@app.route("/isr/<rate>")
def isr(rate):
    global rating_sum, status
    print "hello isr"
    rate = get_avg_rating("isr", rate)
    count = rating_sum["isr"][1]
    
    data = {'info': status, 'rate':rate, 'count':count}
    return json.dumps(data)

@app.route("/far/<rate>")
def far(rate):
    global rating_sum, status
    print "hello far"
    rate = get_avg_rating("far", rate)
    count = rating_sum["far"][1]
    
    data = {'info': status, 'rate':rate, 'count':count}
    return json.dumps(data)

@app.route("/par/<rate>")
def par(rate):
    global rating_sum, status
    print "hello par"
    rate = get_avg_rating("par", rate)
    count = rating_sum["par"][1]
    
    data = {'info': status, 'rate':rate, 'count':count}
    return json.dumps(data)

@app.route("/ba/<rate>")
def ba(rate):
    global rating_sum, status
    print "hello busey-allen"
    rate = get_avg_rating("ba", rate)
    count = rating_sum["ba"][1]
    
    data = {'info': status, 'rate':rate, 'count':count}
    return json.dumps(data)

@app.route("/ikb/<rate>")
def ikb(rate):
    global rating_sum, status
    print "hello ikb"
    rate = get_avg_rating("ikb", rate)
    count = rating_sum["ikb"][1]
    
    data = {'info': status, 'rate':rate, 'count':count}
    return json.dumps(data)

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug = False)


    
    
