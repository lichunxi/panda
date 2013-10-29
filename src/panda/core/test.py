#!/usr/bin/python
# coding=UTF-8
'''
Created on 2013-6-1

@author: lichunxi
'''
import os
from bottle import route, run, static_file, request
from mako.lookup import TemplateLookup
from xml.etree import ElementTree
import traceback

mylookup = TemplateLookup(directories=['../../../WEB-INF/tags'], module_directory='WEB-INF/tags/tmp')

def getComponentDict(tagDir):
    tagDict = {}
    tags = os.walk(tagDir)
    for root, dirs, files in tags:
        for file in files:
            filePath, fileName = os.path.split(file)
            tag, ext = os.path.splitext(fileName)
            tagDict[tag] = fileName
    return tagDict

componentDict = getComponentDict('../../../WEB-INF/tags')

def renderComponent(node, do, **kwargs):
    tagFile = componentDict.get(node.tag)
    if tagFile is None:
        raise PandaException, node.tag + "'s tag is not exist"
    
    mytemplate = mylookup.get_template(tagFile)
    
    ## label的布局方向，水平还是垂直
    labelDirection = node.attrib.get("labelDirection")
    if labelDirection is not None:
        kwargs["labelDirection"]=labelDirection
        
    childs = node.getchildren()
    body = ""
    # 如果有子节点，则先解析子节点
    if len(childs) > 0:
        for child in childs:
            body = body + renderComponent(child, do, **kwargs)

    return mytemplate.render(body=body, do=do, attribs=node.attrib, **kwargs)
            
def renderView(templatename, **kwargs):
    '''从view顶点开始解析XML文件，把每个组件解析出来，最终拼成html'''
    try:
        template = ElementTree.parse(templatename)
        view = template.getroot()
        doPath = view.attrib.get("do")
        doClazz = loadClass(doPath);
        do = doClazz("水煮三国", "lichunxi", 30, "杭州")
        
        return renderComponent(view, do)
    except:
        traceback.print_exc()


def loadClass(clsname):
    '''动态加载指定的类'''
    try:
        r = clsname.rfind('.')
        dname = '__main__'
        bname = clsname
        if r >= 0 :
            dname = clsname[0:r]
            bname = clsname[r + 1:]
        mod = __import__(dname)
        clazz = getattr(mod, bname)
        return clazz
    except:
        traceback.print_exc()
        return None

class PandaException(Exception):
    pass

@route('/hello')
def index():
    print os.getcwd()
    request.headers.get("userId", "aa")
    return renderView("../../../WEB-INF/demo/hello.xml")

@route('/content')
def content():
    return renderView("../../../WEB-INF/demo/content.xml")

@route('/css/<filepath:path>')
def server_css(filepath):
    return static_file(filepath, root='../../../WEB-INF/css')

@route('/js/<filepath:path>')
def server_js(filepath):
    return static_file(filepath, root='../../../WEB-INF/js')

@route('/img/<filepath:path>')
@route('/ico/<filepath:path>')
def server_img(filepath):
    return static_file(filepath, root='../../../WEB-INF/img')

run(host='localhost', port=8080)
