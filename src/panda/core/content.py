#!/usr/bin/python
# coding=UTF-8
'''
Created on 2013-7-25

@author: lichunxi
'''
class Content(object):
    name = None
    userId = None
    age = None
    address = None
    def __init__(self, name, userId, age, address):
        self.name = name
        self.userId = userId
        self.age = age
        self.address = address
        self.city = {"10":"北京","11":"深圳"}
        self.place="sss"
        
    def save(self):
        '''保存到数据库'''
        pass

    @route('/hello')
    def index():
        return renderView("../../../WEB-INF/demo/hello.xml")