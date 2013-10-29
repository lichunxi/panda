#!/usr/bin/python
# coding=UTF-8
'''
Created on 2013年10月25日

@author: lichunxi
'''

import traceback

class Mapper(object):
    
    def __init__(self, request, class_):
        self.class_ = assert_arg_type(class_, type, 'class_')
        self.params = {}
        request.headers
    
class ArgumentException(Exception):
    pass

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

def assert_arg_type(arg, argtype, name):
    if isinstance(arg, argtype):
        return arg
    else:
        if isinstance(argtype, tuple):
            raise ArgumentException(
                "Argument '%s' is expected to be one of type %s, got '%s'" %
                (name, ' or '.join("'%s'" % a for a in argtype), type(arg)))
        else:
            raise ArgumentException(
                "Argument '%s' is expected to be of type '%s', got '%s'" %
                (name, argtype, type(arg)))