
//
//  StatusDbUtils.m
//  微博
//
//  Created by tima_maker on 16/4/19.
//  Copyright © 2016年 lll. All rights reserved.
//

#import "StatusDbUtils.h"
#import "FMDB.h"

@implementation StatusDbUtils

//定义一个静态变量FMDatabase
static FMDatabase *_db;

/**
 *  初始化方法，创建数据表
 */
+(void)initialize{

    //数据库路径
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"statuses.sqlite"];
    //创建数据库对象
    _db =[FMDatabase databaseWithPath:path];
    //打开数据库
    [_db open];
    
    //2、建表,除了query以外，其它都用update执行sql
    NSString *creat_table= @"CREATE TABLE IF NOT EXITS t_status ( id integer PRIMARY KEY,status blob NOT NULL,idstr text NOT NULL ); ";
    [_db executeUpdate:creat_table];
    [_db close];
}



/**
 *  从缓存中取数据(查询数据)
 *
 *  @param params <#params description#>
 *
 *  @return <#return value description#>
 */
+(NSArray*)statusesWidthParams:(NSDictionary *)params{

    NSString *sql =nil;
    //查询语句
    if (params[@"since_id"]) {//下来刷新
        sql = [NSString stringWithFormat:@"SELECT *FROM t_status WHERE idstr > %@ ORDER BY idstr DESC LIMIT 20",params[@"since_id"]];
    }else if(params[@"max_id"]){//上拉加载更多
      sql = [NSString stringWithFormat:@"SELECT *FROM t_status WHERE idstr <= %@ ORDER BY idstr DESC LIMIT 20",params[@"max_id"]];
    }else{
        sql = @"SELECT *FROM t_status ORDER BY idstr DESC LIMIT 20";
    }
    [_db open];
    //执行查询SQL
    FMResultSet *set = [_db executeQuery:sql];
    NSMutableArray *statuses = [NSMutableArray array];
    while (set.next) {//有下一个数据
        //因为我们存储的数据是一个nadata，所以取出的也是一个nsdata数据
        NSData *data=[set objectForColumnName:@"status"];
        //将data转为字典
        NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [statuses addObject:dict];
    }
    [_db close];
    return statuses;
}

/**
 *  将数据保存到数据库里面
 *
 *  @param array
 */
+(void)saveStatus:(NSArray *)array{
    [_db open];
    for(NSDictionary *status in array){
        //将数据存储到表里面
        //有个问题，采用这种方式存储，数据库里面就会将status转为字符串存储到数据表里面。后面我们取出的数据也是
        //string类型，这样就会有个问题，我们是字典转模型，没有字符串转模型，
//        [_db executeUpdateWithFormat:@"INSERT INTO t_status ( status,idstr ) VALUES ( %@ ,%@ );",status,status[@"idstr"]];
        //将字典转为data，数据表里面存储data数据，取出data数据，然后将data转为字典
        NSData *statusData = [NSKeyedArchiver archivedDataWithRootObject:status];
        [_db executeUpdateWithFormat:@"INSERT INTO t_status ( status,idstr ) VALUES ( %@ ,%@ );",statusData,status[@"idstr"]];
        
    }
    [_db close];
}

-(void)dealloc{
    if ([_db open]) {
        [_db close];
    }
}


@end
