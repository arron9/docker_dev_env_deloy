FROM docker.elastic.co/elasticsearch/elasticsearch:6.5.2

RUN bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v6.5.2/elasticsearch-analysis-pinyin-6.5.2.zip
RUN bin/elasticsearch-plugin install -b https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.5.2/elasticsearch-analysis-ik-6.5.2.zip
