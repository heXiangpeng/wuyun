//
//  XmlPaser.m
//  wuyun
//
//  Created by hexiangpeng on 15/10/25.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import "XmlPaser.h"
#import "SercritPager.h"

@interface XmlPaser ()<NSXMLParserDelegate>
@property(nonatomic,strong) NSXMLParser *xmlParser;
@property(nonatomic,retain) SercritPager *parserObjects;
@property(nonatomic,retain) NSMutableArray *tmplist;
@property(nonatomic,strong)NSMutableString* currentString;
@property(nonatomic,retain)NSString* currentTag;
@end

@implementation XmlPaser

+ (XmlPaser *)instance{
    XmlPaser *instance = nil;
    
    if (!instance) {
        instance = [[XmlPaser alloc] init];
    }
    
    return instance;
}

-(void)dataToXml:(NSData *)data complite:(getXml)block{
    _xmlParser = [[NSXMLParser alloc] initWithData:data];
      _tmplist = [[NSMutableArray alloc] init
                  ];
//     _parserObjects = [[SercritPager alloc] init];
    [_xmlParser setDelegate:self];
    [_xmlParser parse];
    block(self.tmplist);
}

-(void)parserDidStartDocument:(NSXMLParser *)parser{
    
    
    
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    
    self.currentTag = elementName;
    
    if ([elementName isEqualToString:@"channel"]) {
        
        
        
    }else if ( [elementName isEqualToString:@"item"] ) {
     
       
        
    }
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if (self.currentString == nil) {
        self.currentString = [[NSMutableString alloc] initWithString:@""];
        
    }
    if ([self.currentTag isEqualToString:@"item"]) {
       _parserObjects = [[SercritPager alloc] init];
    }
    
    if ([self.currentTag isEqualToString:@"title"] ||
        [self.currentTag isEqualToString:@"dc:creator"] ||
        [self.currentTag isEqualToString:@"content:encoded"] ||
        [self.currentTag isEqualToString:@"pubDate"]
        ) {
   
        [self.currentString appendString:string];
        
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
  
    if ([elementName isEqualToString:@"item"]) {
        
       
      
        
        [self.tmplist addObject:_parserObjects];
//        NSLog(@"%lu",(unsigned long)[_parserObjects retainCount]);
        
        
        
        
        
        
       
        
        
    } if ([elementName isEqualToString:@"title"]) {
      
        _parserObjects.title = [self.currentString copy];
//         NSLog(self.parserObjects.title);
        [self.currentString setString:@""];
    }else if ([elementName isEqualToString:@"dc:creator"]) {
       
        _parserObjects.creator = [self.currentString copy];
        
        [self.currentString setString:@""];
    }else if ([elementName isEqualToString:@"content:encoded"]) {
      
       
         _parserObjects.content = [self.currentString copy];
        [self.currentString setString:@""];
    }else if ([elementName isEqualToString:@"pubDate"]) {
        
        _parserObjects.date = [self.currentString copy];
        [self.currentString setString:@""];
    }
    
    

    
    
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
//     [self.tmplist release];
}
@end
