import pymongo

# 连接
mongoclient = pymongo.MongoClient("mongodb://root:root@192.168.17.109:27017")
# print (mongoclient.list_database_names())
#查询
mydb = mongoclient['devops']
mycol = mydb['servers']
print(mycol.find())
for data in mycol.find():
 print(data)

# 添加
#insertData = {'name':'server10','type':'mongodb','ip':'192.168.17.109','status':1}
# rs = mycol.insert(insertData)
# print(rs)

# 修改
#query = {'hostname':'server01'}
#newValue = {'$set':{'status':1}}
#mycol.update_one(query,newValue)

# 删除