#!/usr/bin/env python
# coding: utf-8

import pymongo
from pymongo import MongoClient

client = MongoClient('localhost', username='suishi_rw', password='suishi@2018@Undermine', authSource='quiz_db',
                     authMechanism='SCRAM-SHA-256')

client.server_info()

quiz_db = client.quiz_db

questions = quiz_db.questions

q1 = {
    'qid': 1,
    'body': '''“二十四节气”是我国农耕社会生产生活的时间指南，反映了从春到冬一年四季的气温、降水、物候的周期性变化规律。已知各节气的名称具有如下特点：
（1）凡含“春”“夏”“秋”“冬”字的节气各属春、夏、秋、冬季；
（2）凡含“雨”“露”“雪”字的节气各属春、秋、冬季；
（3）如果“清明”不在春季，则“霜降”不在秋季；
（4）如果“雨水”在春季，则“霜降”在秋季。
根据以上信息，如果从春至冬每季仅列两个节气，则以下哪项是不可能的？''',
    'body_images': [],
    'candidates': [
        {
            'cid': 1,
            'body': '立春、清明、立夏、夏至、立秋、寒露、小雪、大寒。',
            'body_images': [],
        },
        {
            'cid': 2,
            'body': '惊蛰、春分、立夏、小满、白露、寒露、立冬、小雪。',
            'body_images': [],
        },
        {
            'cid': 3,
            'body': '雨水、惊蛰、夏至、小暑、白露、霜降、大雪、冬至。',
            'body_images': [],
        },
        {
            'cid': 4,
            'body': '立春、谷雨、清明、夏至、处暑、白露、立冬、小雪。',
            'body_images': [],
        }
    ],
    'answer': [1],
}

q2 = {
    'qid': 2,
    'body': '''中国是全球最大的卷烟生产国和消费国，但近年来政府通过出台禁烟令，提高卷烟清费税等一系列公共政策努力改变这一形象，一项权威调查数据显示，在2014年同比上升2.4%之后，中国卷烟消费是在2015年同比下降了2.4%，这是1995年来首次下降，尽管如此，2015年中国卷烟消费量仍占全球的45%，但这一下降对全球卷烟总消费量产生巨大影响，使其同比下降了2.1%
根据以上信息，可得出以下哪项？''',
    'body_images': [],
    'candidates': [
        {
            'cid': 1,
            'body': '2015年中国卷烟消费量恰好等于2013年',
            'body_images': [],
        },
        {
            'cid': 2,
            'body': '2015年中国卷烟消费量大于2013年',
            'body_images': [],
        },
        {
            'cid': 3,
            'body': '2015年世界其他国家卷烟消费量国比下降比率高于中国',
            'body_images': [],
        },
        {
            'cid': 4,
            'body': '2015年世界其他国家卷烟消费量国比下降比率低于中国',
            'body_images': [],
        },
        {
            'cid': 5,
            'body': '2015年发达国家卷烟消费量国比下降比例高于发展中国家',
            'body_images': [],
        }
    ],
    'answer': [3],
}

q3 = {
    'qid': 3,
    'body': '''某校四位女生陈琳、张芳、王玉、杨虹和四位男生范勇、吕伟、赵虎、李龙进行中国象棋比赛。他们被安排在四张桌上，每桌一男一女对弈，四张桌从左到右分别记为1、2、3、4号，
每对选手需要进行四局比赛，比赛规定：选手每胜一局得2分，和一局得1分，负一局得0分。前三局结束时，按分差大小排列，四对选手的总积分分别是6:0，5:1，4:2，3:3。已知：
（1）张芳跟吕伟对弈，杨虹在4号桌比赛，王玉的比赛桌在李龙比赛桌的右边；
（2）1号桌的比赛至少有一桌是和局，4号桌的总积分不是4:2；
（3）赵虎前三局总积分并不领先他的对手，他们也没有下成过和局；
（4）李龙已连输三局，范勇在前三局总积分上领先他的对手。
如果下列有位选手前三局均与对手下成和局，那么他(她)是谁？''',
    'body_images': [],
    'candidates': [
        {
            'cid': 1,
            'body': '陈琳',
            'body_images': [],
        },
        {
            'cid': 2,
            'body': '杨虹',
            'body_images': [],
        },
        {
            'cid': 3,
            'body': '张芳',
            'body_images': [],
        },
        {
            'cid': 4,
            'body': '范勇',
            'body_images': [],
        },
        {
            'cid': 5,
            'body': '王玉',
            'body_images': [],
        }
    ],
    'answer': [5],
}

qs = [q1, q2, q3]

questions.create_index([('qid', pymongo.ASCENDING)], unique=True)

print(questions.index_information())

result = questions.insert_many(qs)

print(result.inserted_ids)


for q in questions.find():
    print(q)

client.close()
