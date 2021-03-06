//
//  Resources.h
//  BPcontrol
//
//  Created by Adrian Carrera on 26/4/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#define BPcontrol_Resources_h
#ifndef Resources_h
#define Resources_h

#ifdef DEBUG
#define DLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DLog( s, ... )
#endif

#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define GRAYBP RGB(212,212,212)
#define GRAYMENUCELL RGB(236,236,236)
#define MENUSEPARATOR RGB(157,156,156)
#define MENUTEXT RGB(77,94,110)
#define CELLHEADER RGB(234,234,234)
#define GRAYPROFILE RGB(108,108,108)
#define ORANGEBUTTON RGB(255,108,82)

//#define STRTRAD(key, comment) NSLocalizedStringFromTable(key, [LanguageController getCurrentLanguage], comment)
#define STRTRAD(key, comment) comment

// Return nil when __INDEX__ is beyond the bounds of the array
#define NSArrayObjectMaybeNil(__ARRAY__, __INDEX__) ((__INDEX__ >= [__ARRAY__ count]) ? nil : [__ARRAY__ objectAtIndex:__INDEX__])

#define pragma

// Manually expand an array into an argument list
#define NSArrayToVariableArgumentsList(__ARRAYNAME__)\
NSArrayObjectMaybeNil(__ARRAYNAME__, 0),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 1),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 2),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 3),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 4),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 5),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 6),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 7),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 8),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 9),\
nil

typedef void (^CompletionBlock)(NSError *error, id object);

#define FONT(fname,fsize) [UIFont fontWithName:fname size:fsize]

#define FORTE              @"Forte"
#define ROBOTOREGULAR      @"Roboto-Regular"
#define ROBOTOBOLD         @"Robot-Bold"
#define ROBOTOITALIC       @"Roboto-Italic"

#define FORTE_FONT(fsize) FONT(FORTE, fsize)
#define ROBOTOREGULAR_FONT(fsize) FONT(ROBOTOREGULAR, fsize)
#define ROBOTOBOLD_FONT(fsize) FONT(ROBOTOBOLD, fsize)
#define ROBOTOITALIC_FONT(fsize) FONT(ROBOTOITALIC_FONT, fsize)

#define URL_FACEBOOK     @"https://www.facebook.com/"
#define URL_FACEBOOK_APP @"fb://profile/107718629298104"
#define URL_TWITTER      @"https://twitter.com/"
#define URL_INSTAGRAM    @"http://instagram.com//"
#define URL_GOOGLEPLUS   @"https://plus.google.com/"

#define NumMenuOptions 18
#define Profile @"profile"
#define Init @"init"
#define BloodPressures @"pressures"
#define Evolutiont @"evolution"
#define PatientHistory @"patienthistory"
#define Messages @"messages"
#define Videos @"videos"
#define HealthCenters @"healthcenters"
#define Contact @"contact"
#define Help @"help"
#define Facebook @"facebook"
#define Twitter @"twitter"
#define GooglPlus @"googleplus"
#define Attributions @"attributions"
#define Logo @"logo"
#define ProfileHeader @"profileheader"
#define Sections @"sections"
#define Social  @"social"
#define Others  @"others"


#define TLFNSUSER @"telephone"
#define PREFIXSAVE @"prefix"
#define USERUUID @"useruuid"
#define LASTUPDATEDATE @"lasdate"

#define MORNING_FIRST @"morningfirsttime"
#define MORNING_SECOND @"morningsecondtime"
#define MORNING_THIRD @"morningthirdtime"

#define AFTERNOON_FIRST @"afternoonfirsttime"
#define AFTERNOON_SECOND @"afternoonsecondtime"
#define AFTERNOON_THIRD @"afternoonthirdtime"

#define kGreenSemaphore 0
#define kYellowSempahore 1
#define kRedSemaphore 2

#define kMaxComponents 3

#define kSystolicM1 1
#define kDiastolicM1 2
#define kPulseM1 3
#define kSystolicM2 4
#define kDiastolicM2 5
#define kPulseM2 6
#define kSystolicM3 7
#define kDiastolicM3 8
#define kPulseM3 9

#define kSystolicA1 10
#define kDiastolicA1 11
#define kPulseA1 12
#define kSystolicA2 13
#define kDiastolicA2 14
#define kPulseA2 15
#define kSystolicA3 16
#define kDiastolicA3 17
#define kPulseA3 18

#define kJanuary 1
#define kFebruary 2
#define kMarch 3
#define kApril 4
#define kMay 5
#define kJune 6
#define kJuly 7
#define kAugust 8
#define kSeptember 9
#define kOctober 10
#define kNovember 11
#define kDecember 12

#endif
