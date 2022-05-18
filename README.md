# TAQO-PAM Hackathon - QAOA with Custom Topologies

## Setup

### Docker

```
docker build -t taqopam_hackathon .
docker run --name hackathon -v $PWD:/home/hackathon/hackathon -p 8888:8888 -d taqopam_hackathon
```

### Local

```
pip install -r requirements.txt
./run.sh jupyter
```

### Start Hackathon
Open http://localhost:8888/notebooks/hackathon.ipynb in a Browser.