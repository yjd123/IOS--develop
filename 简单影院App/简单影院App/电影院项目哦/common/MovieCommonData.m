

#import "MovieCommonData.h"

@implementation MovieCommonData


+(instancetype)requestData:(NSString *)fileName
{
    NSString *filePath=[[NSBundle mainBundle]pathForResource:fileName ofType:NULL];
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    
    id jason=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    return jason;
}




@end
