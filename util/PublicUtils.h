//
//  PublicUtils.h
//  公共设置
//
//  Created by lll on 16/3/1.
//  Copyright © 2016年 lll. All rights reserved.
//

#ifndef PublicUtils_h
#define PublicUtils_h

//（a,b）逗号表达式，只取后面的值，
// 宏里面的#，会自动把后面的参数变成C语言的字符串
// C字符串转为oc字符串 @(c字符串)；
// 动态替换宏：示例 keyPath(_manView,frame) 自动替换为@“frame”;
#define keyPath(objc,keyPath) @(((void)objc.keyPath,#keyPath))




#endif /* PublicUtils_h */
