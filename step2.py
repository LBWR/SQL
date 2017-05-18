#encoding:utf-8
import MySQLdb

#定义读取函数，目的是将各个数据库数据按行存入元组列表中，方便后面用executemany（）直接一次向数据库中插入多个元组
def load(file, list):
    for line in file:#逐行读取
        tmp=line.split()#每行按空格将属性值分割并存入列表中
        for value in tmp:#检查属性值
            if value.isdigit():#判断字符串是否为纯数字，如果是，将相应的值修改为纯数字
                value=int(value)
        list.append(tuple(tmp))#最后将修改为不可变的元组存入列表供executemany（）使用
    file.close()

d=open('/home/lbw/Downloads/MySQL上课文件/作业/university/department.txt','r')
s=open('/home/lbw/Downloads/MySQL上课文件/作业/university/student.txt','r')
e=open('/home/lbw/Downloads/MySQL上课文件/作业/university/exam.txt','r')

department=list()
student=list()
exam=list()

#得到各个表中的所有元组
load(d, department)
load(s, student)
load(e, exam)

conn = MySQLdb.connect(
    host='localhost',
    port=3306,
    user='root',
    passwd = '623911',
    charset ='utf8',
    db ='university'
)

cur = conn.cursor()

try:
    cur.executemany("insert into department values(%s, %s, %s)", department)
    conn.commit()
    cur.executemany("insert into student values(%s, %s, %s, %s, %s, %s)", student)
    conn.commit()
    cur.executemany("insert into exam values(%s, %s, %s) ", exam)
    conn.commit()
    r=cur.fetchone()
    results= cur.fetchmany(3)
    results= cur.fetchall()

except Exception as e:
    print e
    print e
finally:
    cur.close()
    conn.close()

